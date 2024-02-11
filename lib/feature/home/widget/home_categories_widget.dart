import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/model/categories_model.dart';
import 'package:flutter_boilerplate/feature/home/controller/home_controller.dart';
import 'package:flutter_boilerplate/feature/home/widget/categories_card.dart';
import 'package:get/get.dart';

class HomeCategoriesWidget extends StatelessWidget {
  final HomeController homeController;
  const HomeCategoriesWidget({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("categories".tr,style: Get.textTheme.titleMedium!.copyWith(color: Get.theme.hintColor,),),
        const SizedBox(height: 10,),
        SizedBox( height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homeController.getCategories().length,
            itemBuilder: (context, index) {
            CategoriesModel categories=  homeController.getCategories().elementAt(index);
            return CategoriesCard(categoriesName: categories.categoriesName??"",totalCompleted: categories.totalCompleted,totalTodo: categories.totalTodo,);
          },),
        )
      ],
    );
  }
}
