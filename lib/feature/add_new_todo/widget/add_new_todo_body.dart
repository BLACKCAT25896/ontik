import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../../common/model/todo_model.dart';
import '../../../helper/date_converter.dart';

class AddNewTodoBody extends StatelessWidget {
  final int? index;
  final TodoModel? data;
  const AddNewTodoBody({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    bool forEdit = (index != null) && (data != null);
    return GetBuilder<HomeController>(
      initState: (state) {
        final homeController = Get.find<HomeController>();
        if(forEdit){
          homeController.titleController.text = data?.todoTitle??"";
          homeController.todoController.text = data?.todoNote??"";
          homeController.categoryController.text = data?.category??"";
          homeController.isImportant = data?.inImportant??false;
          if(data?.todoTime != null){
            homeController.todoTime = data?.todoTime??"";
          }

          if(data?.todoDate != null){
            homeController.todoDate = data?.todoDate??"";
          }


        }
      },
      dispose: (state) => Get.find<HomeController>().clearAddTodoData(),
      builder: (homeController) {
        return Form(
          key: homeController.todoFormKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
            children: [
              Align(alignment: Alignment.topRight,
               child: InkWell(
                 onTap: () {Get.back();
                   homeController.clearAddTodoData();} ,
                 borderRadius: BorderRadius.circular(50),
                 child: Container(height: 50,width: 50,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                     border: Border.all(color: Get.theme.hintColor,width: 2),),
                   child: Icon(Icons.clear,color:Get.theme.colorScheme.surface,size: 30),),),),

              SizedBox(height: Get.width/5,),
              Text("Title".tr,style: Get.textTheme.displayLarge!.copyWith(fontSize: 26, color: Get.theme.colorScheme.surface.withOpacity(0.5),),),

              TextFormField(
                controller: homeController.titleController,
                style: Get.textTheme.titleLarge,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if(value!=null){
                    if(value.isEmpty){
                      return "please_enter_title".tr;
                    }
                  }
                  return null;
                },
              ),


              const SizedBox(height: 30,),
              Text("Note".tr,style: Get.textTheme.displayLarge!.copyWith(fontSize: 26, color: Get.theme.colorScheme.surface.withOpacity(0.5),),),

              TextFormField(
                controller: homeController.todoController,
                style: Get.textTheme.titleLarge,
                maxLines: 3,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if(value!=null){
                    if(value.isEmpty){
                      return "please_enter_todo".tr;
                    }
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30,),
              Text("category".tr,style: Get.textTheme.displayLarge!.copyWith(fontSize: 24, color: Get.theme.colorScheme.surface.withOpacity(0.5),),),

              TextFormField(
                controller: homeController.categoryController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 28,
                style: Get.textTheme.titleLarge,
                decoration: InputDecoration(
                    counterStyle:Get.textTheme.titleSmall!.copyWith(fontSize: 16) ),
                validator: (value) {
                  if(value!=null){
                    if(value.isEmpty){
                      return "select_category".tr;
                    }
                  }
                  return null;
                },
              ),

              Wrap(children: [
                 CustomChipButton(icon: Icons.calendar_month,
                  value: DateConverter.formatDateString(homeController.todoDate) ,
                onTap: () async => await homeController.pickTodoDateTime(context,isTime: false),
                ),
                 CustomChipButton(icon: Icons.access_time_rounded,
                value: homeController.todoTime,
                onTap: () async => await homeController.pickTodoDateTime(context,isTime: true),
                ),
                CustomChipButton(icon: Icons.info_outline_rounded,
                  value: "important".tr,
                  buttonColor:homeController.isImportant? Get.theme.primaryColor:null ,
                  onTap: () => homeController.toggleImportant(),
                )
              ],)


          ],),
        );
      }
    );
  }
}

class CustomChipButton extends StatelessWidget {
  final String? value;
  final IconData icon;
  final Function()? onTap;
  final Color? buttonColor;
  const CustomChipButton({
    super.key, this.value, this.onTap, required this.icon, this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(50),
            border: buttonColor!=null? null: Border.all(color:Get.theme.hintColor.withOpacity(0.5),width: 2 ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,color: buttonColor !=null? Get.theme.colorScheme.onSurface :Get.theme.primaryColor),
              if(value != null)...[
                const SizedBox(width: 4,),
                Text(value??"",style: Get.textTheme.titleMedium!.copyWith(color: buttonColor !=null? Get.theme.colorScheme.onSurface :Get.theme.primaryColor ),)
              ]


            ],
          ),
        ),
      ),
    );
  }
}
