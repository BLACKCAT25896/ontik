import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/controller/home_controller.dart';
import 'package:flutter_boilerplate/feature/home/widget/home_categories_widget.dart';
import 'package:flutter_boilerplate/feature/home/widget/home_todo_list_widget.dart';
import 'package:flutter_boilerplate/feature/home/widget/home_top_widget.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:get/get.dart';

import '../../../util/images.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
        builder: (homeController) {
          return  homeController.isPageLoading? const Center(child: CircularProgressIndicator(),) :  RefreshIndicator(
            onRefresh: ()  async => homeController.todoData =  await homeController.retrieveTodoModelList(),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal:Dimensions.paddingSize),
              children:  [
                const HomeTopWidget(),
                if(homeController.todoData.isEmpty)...[
                  SizedBox(height: Get.height/15,),
                  Image.asset(Images.noDataFound)
                ]else...[

                  const SizedBox(height: 20,),
                  HomeCategoriesWidget(homeController: homeController),

                  const SizedBox(height: 20,),
                  HomeTodoListWidget(homeController: homeController,),
                ]


              ],
            ),
          );
        }
      ),
    );
  }
}
