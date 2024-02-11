import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helper/toaster.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../home/controller/home_controller.dart';

class AddToDoButton extends StatefulWidget {
  final bool forEdit;
  final int? index;
  const AddToDoButton({super.key,  this.forEdit =false, this.index});

  @override
  State<AddToDoButton> createState() => _AddToDoButtonState();
}

class _AddToDoButtonState extends State<AddToDoButton> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (homeController) {
          return ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.forEdit? "Update Todo" : "Add Todo",style: Get.textTheme.titleMedium!.copyWith(color:Get.theme.colorScheme.onSurface ),),
                const SizedBox(width: 4,),
                Icon(Icons.add,color:Get.theme.colorScheme.onSurface,)
              ],
            ),
            onPressed: () async {
              if(homeController.todoFormKey.currentState!.validate()){
                if(homeController.todoDate == null){
                  showCustomToaster("Please Add ToDo Date");
                }else if(homeController.todoTime == null){
                  showCustomToaster("Please Add ToDo Time");
                }else{

                  if(widget.forEdit && widget.index != null){
                    homeController.updateToDo(widget.index);
                  }else{
                    homeController.addNewToDo();
                  }

                }
              }

            },);
        }
    );
  }
}
