import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesCard extends StatelessWidget {
  final String categoriesName ;
  final int totalCompleted;
  final int totalTodo;
  const CategoriesCard({
    super.key, required this.categoriesName, required this.totalCompleted, required this.totalTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height:120, width: 220,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(color: Get.theme.colorScheme.onSurface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Get.theme.hintColor.withOpacity(0.30),blurRadius: 20)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$totalTodo todo".tr,style: Get.textTheme.titleSmall!.copyWith(fontSize:16, color: Get.theme.hintColor,),),
          const SizedBox(height: 4,),
          Text(categoriesName,style: Get.textTheme.titleMedium!.copyWith(fontSize: 20, color: Get.theme.colorScheme.surface,),),
          const SizedBox(height: 10,),
          LinearProgressIndicator(value: totalCompleted/totalTodo,
            borderRadius: BorderRadius.circular(50),
            backgroundColor: Get.theme.hintColor.withOpacity(0.4),),

        ],
      ),
    );
  }
}