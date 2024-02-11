import 'package:flutter_boilerplate/helper/route_helper.dart';
import 'package:flutter_boilerplate/util/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController implements GetxService{
  final SharedPreferences sharedPreferences;
  OnboardingController({required this.sharedPreferences});

  Future<void> routePage() async {
   // await sharedPreferences.setBool(AppConstants.skipOnboarding, true);
    Get.offAllNamed(RouteHelper.login);

  }
}