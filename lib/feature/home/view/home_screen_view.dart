import 'package:flutter/material.dart';
import 'dart:math'as math;

import 'package:flutter_boilerplate/feature/home/widget/home_body.dart';
import 'package:flutter_boilerplate/helper/route_helper.dart';
import 'package:get/get.dart';

class HomeScreenView extends StatelessWidget {

  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(gradient: SweepGradient(colors: [Get.theme.colorScheme.onSurface, Colors.grey.shade100], transform: GradientRotation(math.pi / 2),)),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: const HomeBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(RouteHelper.getAddNewTodoRoute(),),
          backgroundColor: Get.theme.primaryColor, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(Icons.add,color: Get.theme.colorScheme.onSurface,size: 40),
        ),
      ),
    );
  }
}
