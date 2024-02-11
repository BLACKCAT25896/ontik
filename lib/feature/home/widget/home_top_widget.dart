import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/controller/home_controller.dart';
import 'package:flutter_boilerplate/helper/display_helper.dart';
import 'package:get/get.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( getGreetingMessage(),style: Get.textTheme.displayMedium!.copyWith(color: Get.theme.colorScheme.surface,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            Text(homeController.googleAccount?.displayName??'John Doe',style: Get.textTheme.displayLarge!.copyWith(fontSize: 20, color: Get.theme.colorScheme.surface,),),

          ],
        );
      }
    );
  }
}
