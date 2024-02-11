import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/model/todo_model.dart';
import 'package:flutter_boilerplate/helper/date_converter.dart';
import 'package:get/get.dart';
//Bottom
class BottomSheetDetailsView extends StatelessWidget {
  final TodoModel? todo;
  const BottomSheetDetailsView({super.key, this.todo});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(24),
        children: <Widget>[
          Row(
            children: [
              Expanded(child: Text("${DateConverter.formatDateString(todo?.todoDate)} ${todo?.todoTime??""} | ${todo?.todoNote?.length??'0'} characters",style: Get.textTheme.titleMedium!.copyWith(color: Get.theme.hintColor ),)),
              const SizedBox(width: 10,),
              InkWell(onTap: () => Get.back(), borderRadius: BorderRadius.circular(100), child: Icon(Icons.cancel,color: Get.theme.primaryColor,))
            ],
          ),
          const SizedBox(height: 4,),
          Text("CATEGORY : ${todo?.category??""}",style: Get.textTheme.titleMedium!.copyWith(color: Get.theme.hintColor ),),

          const SizedBox(height: 12,),
          Text(todo?.todoTitle??"",style: Get.textTheme.titleLarge!.copyWith(fontSize: 30, color: Get.theme.colorScheme.outline,fontWeight: FontWeight.w800 ),),

          const SizedBox(height: 10,),
          Text(todo?.todoNote??"",style: Get.textTheme.titleLarge!.copyWith(fontSize: 20, color: Get.theme.colorScheme.outline.withOpacity(0.8),fontWeight: FontWeight.w400 ),),
    ]);
  }
}
