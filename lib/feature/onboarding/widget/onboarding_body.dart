import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../../../util/images.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (controller) {
        return SafeArea(
          child: Column(children: [
            SizedBox(height: Get.height/10,),
            Image.asset(Images.onboardingImage,width: Get.width,),
            const Spacer(),
            Container( height: Get.height /3,width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical:20),
              decoration: BoxDecoration(color: Get.theme.colorScheme.onSurface, borderRadius: const BorderRadius.vertical(top:Radius.elliptical(50, 60)),),
              child: Column(
                children: [
                  Text("easiest_way".tr,textAlign: TextAlign.center,
                    style: Get.textTheme.displayLarge!.copyWith(fontSize: Get.width/11,color: Get.theme.colorScheme.surface,fontWeight: FontWeight.w900),),

                  SizedBox(height: Get.height/50,),
                  Text("organized_all_your_task".tr,textAlign: TextAlign.center,
                    style: Get.textTheme.titleMedium!.copyWith(
                      color: Get.theme.hintColor,fontSize: Get.width/20
                    ),),

                  SizedBox(height: Get.height/45,),
                  InkWell(
                    onTap: () => controller.routePage(),
                    borderRadius: BorderRadius.circular(50),
                    child: CircleAvatar(radius: Get.height/25,
                      backgroundColor: Get.theme.colorScheme.secondary,
                      child: Icon(Icons.arrow_forward_ios_outlined,color: Get.theme.colorScheme.onSurface,size:Get.height/30 ,),
                    ),
                  )
                ],
              ),
            )
          ],),
        );
      }
    );
  }
}
