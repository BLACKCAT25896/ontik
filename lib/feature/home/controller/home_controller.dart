
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/model/todo_model.dart';
import 'package:flutter_boilerplate/feature/home/domain/repo/home_repo.dart';
import 'package:flutter_boilerplate/helper/display_helper.dart';
import 'package:flutter_boilerplate/util/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../../common/model/categories_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
class HomeController extends GetxController implements GetxService {
  HomeRepo homeRepo;
  HomeController(this.homeRepo);

  List<TodoModel> todoData = [];
  final storage = const FlutterSecureStorage();

  TextEditingController titleController = TextEditingController();
  TextEditingController todoController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  final todoFormKey = GlobalKey<FormState>();

  bool isPageLoading = false;


  @override
  void onInit() async {
    isPageLoading = true;
    todoData =  await retrieveTodoModelList();
    isPageLoading = false;
    update();
    super.onInit();
  }
  String? todoDate;
  String? todoTime;
  bool isImportant = false;

  AndroidOptions _androidOptions() => const AndroidOptions(encryptedSharedPreferences: true,);
  IOSOptions _iOSOptions() => const IOSOptions(accountName: AppConstants.accountName,);

  void toggleImportant(){
    isImportant = !isImportant;
    update();
  }

  Future<void> pickTodoDateTime(BuildContext context,{required bool isTime}) async{
    String? time;
    String? date;
    print(DateTime.tryParse(todoTime??"") );
    print( DateTime.tryParse(todoDate??""));
    if(isTime){

      await pickTime(context,selectedTime: TimeOfDay.fromDateTime(DateTime.tryParse(todoTime??"")?? DateTime.now())).then((value) async{
        time = value;
        update();
        date = await pickDate(context,selectedDate: DateTime.tryParse(todoDate??"")  );
        return null; });

    }else{
      await pickDate(context, selectedDate:DateTime.tryParse(todoDate??"")).then((value) async{
        date = value;
        update();
        time = await pickTime(context,selectedTime: TimeOfDay.fromDateTime(DateTime.tryParse(todoTime??"")?? DateTime.now()));
        return null;
      });

    }
    if(date != null){todoDate = date;}
    if(time != null){todoTime = time;}

    update();

  }

  void clearAddTodoData(){
    todoDate = null;
    todoTime = null;
    isImportant = false;
    titleController.clear();
    todoController.clear();
    categoryController.clear();
  }

  Future<void> storeTodoModelList(List<TodoModel> models) async {
    String jsonString = json.encode(models.map((model) => model.toJson()).toList());
    await storage.write(key: AppConstants.todoList, value: jsonString,aOptions: _androidOptions(),iOptions: _iOSOptions());
  }

  Future<List<TodoModel>> retrieveTodoModelList() async {
    // Retrieve the JSON string
    String? jsonString = await storage.read(key:  AppConstants.todoList,aOptions: _androidOptions(),iOptions: _iOSOptions());
    if (jsonString == null) return [];

    // Convert JSON string to List<TodoModel>
    List<dynamic> jsonList = json.decode(jsonString);
    List<TodoModel> models = jsonList.map((jsonItem) => TodoModel.fromJson(jsonItem)).toList();
    return models;
  }

  Future<void> deleteTodoModelAtIndex(int index) async {
    customPrint("Enter deleteTodoModelAtIndex");
    // Step 1: Retrieve the current list of TodoModel
    List<TodoModel> models = await retrieveTodoModelList();

    // Check if models is not null and index is in range
    if (index >= 0 && index < models.length) {
      // Step 2: Remove the TodoModel at the specified index
      models.removeAt(index);

      // Step 3: Store the updated list back into storage
      await storeTodoModelList(models);
    } else {
      customPrint("Invalid index or empty list.");
    }
  }

  Future<void> addTodoData(TodoModel newModel) async {
    // Step 1: Retrieve the existing list
    String? jsonString = await storage.read(key: AppConstants.todoList,aOptions: _androidOptions(),iOptions: _iOSOptions());
    List<TodoModel> models;
    if (jsonString != null) {
      // Decode the JSON string to a list of TodoModel objects if there's existing data
      List<dynamic> jsonList = json.decode(jsonString);
      models = jsonList.map((jsonItem) => TodoModel.fromJson(jsonItem)).toList();
    } else {
      // Initialize an empty list if there's no existing data
      models = [];
    }

    // Step 2: Add the new TodoModel to the list
    models.add(newModel);

    // Step 3: Store the updated list back into storage
    String updatedJsonString = json.encode(models.map((model) => model.toJson()).toList());
    await storage.write(key: AppConstants.todoList, value: updatedJsonString,aOptions: _androidOptions(),iOptions: _iOSOptions());
  }

  Future<void> updateTodoModelAtIndex(int index, TodoModel updatedModel) async {

    String? jsonString = await storage.read(key: AppConstants.todoList,aOptions: _androidOptions(),iOptions: _iOSOptions());
    if (jsonString == null) return;

    List<dynamic> jsonList = json.decode(jsonString);
    List<TodoModel> models = jsonList.map((jsonItem) => TodoModel.fromJson(jsonItem)).toList();


    if (index < 0 || index >= models.length) {
      customPrint("Index out of bounds");
      return;
    }

    models[index] = updatedModel;

    String updatedJsonString = json.encode(models.map((model) => model.toJson()).toList());
    await storage.write(key: AppConstants.todoList, value: updatedJsonString,aOptions: _androidOptions(),iOptions: _iOSOptions());
  }

  Future<void> addNewToDo() async{

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        todoController.text.trim(),
        titleController.text,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'ontik', 'ontik',
                channelDescription: 'ontik')),
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);

    await addTodoData(TodoModel(
        inImportant: isImportant,
        todoDate: todoDate,
        todoTime: todoTime,
        todoNote: titleController.text,
        todoTitle: todoController.text.trim(),
        category: categoryController.text.trim()));

    todoData = await retrieveTodoModelList()??[];

    Get.back();
    clearAddTodoData();
    sortTodoData();
    update();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  late GoogleSignInAuthentication auth;

  Future<void> googleLogin() async {
    googleAccount = await _googleSignIn.signIn();
    auth = await googleAccount!.authentication;
    update();
  }

  Future<void> updateToDo(int? index) async{
    if(index == null){Get.back();return;}

   await updateTodoModelAtIndex(index, TodoModel(
        inImportant: isImportant,
        todoDate: todoDate,
        todoTime: todoTime,
        todoNote: titleController.text,
        todoTitle: todoController.text.trim(),
        category: categoryController.text.trim()));

   todoData = await retrieveTodoModelList();

    Get.back();
    clearAddTodoData();
    sortTodoData();
    update();
  }

  void sortTodoData() {
    todoData.sort((a, b) {
      int dateComparison = (a.todoDate ?? '').compareTo(b.todoDate ?? '');
      if (dateComparison != 0) {
        return dateComparison;
      }
      return (a.todoTime ?? '').compareTo(b.todoTime ?? '');
    });
  }

  String? getTimeGroup (String? date){
    if(date == null){return null;}
    DateTime currentDate = DateTime.now();
    DateTime todoDate = DateFormat('dd-MM-yyyy').parse(date);
    String timeGroup;
    if (todoDate.isAtSameMomentAs(currentDate)) {
      timeGroup = "THINGS TO DO TODAY";
    } else if (todoDate.isAfter(currentDate)) {
      timeGroup = "THINGS TO DO TOMORROW";
    } else {
      timeGroup = "ALL THINGS TO DO";
    }
    return timeGroup;

  }

  List<CategoriesModel> getCategories() {
    Map<String, CategoriesModel> categoryMap = {};

    for (TodoModel todo in todoData) {
      String categoryName = todo.category ?? 'Uncategorized';

      CategoriesModel category = categoryMap[categoryName] ?? CategoriesModel(
        categoriesName: categoryName,
        totalCompleted: 0,
        totalTodo: 0,
      );

      category.totalTodo += 1;

      if (todo.isCompleted == true) {
        category.totalCompleted += 1;
      }

      categoryMap[categoryName] = category;
    }

    List<CategoriesModel> categoriesList = categoryMap.values.toList();
    return categoriesList;
  }

  Future<void> setCompletedStatusByIndex(int index, {required bool value}) async {

    List<TodoModel> models = await retrieveTodoModelList();
    if (index >= 0 && index < models.length) {
      models[index] = models[index].copyWith(isCompleted: value);
    }

    await storeTodoModelList(models);
    todoData = await retrieveTodoModelList();
    update();
  }

  Future<void> deleteTodo(int index) async {
    await deleteTodoModelAtIndex(index);
    todoData = await retrieveTodoModelList();
    update();
  }

}