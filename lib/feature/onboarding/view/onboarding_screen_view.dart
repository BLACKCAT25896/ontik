import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/onboarding/widget/onboarding_body.dart';
import 'package:get/get.dart';

class OnboardingScreenView extends StatelessWidget {
  const OnboardingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      body:  const OnboardingBody(),
    );
  }
}
