import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/common/controller/localization_controller.dart';
import 'package:flutter_boilerplate/common/controller/splash_controller.dart';
import 'package:flutter_boilerplate/common/controller/theme_controller.dart';
import 'package:flutter_boilerplate/common/model/language_model.dart';
import 'package:flutter_boilerplate/data/api_client.dart';
import 'package:flutter_boilerplate/feature/home/controller/home_controller.dart';
import 'package:flutter_boilerplate/feature/home/domain/repo/home_repo.dart';
import 'package:flutter_boilerplate/feature/onboarding/controller/onboarding_controller.dart';
import 'package:flutter_boilerplate/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
  Get.lazyPut(() => HomeRepo(Get.find()));

  // Repository



  // Controller
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => HomeController(Get.find()));
  Get.lazyPut(() => OnboardingController(sharedPreferences: Get.find()));



  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> languageJson = {};
    mappedJson.forEach((key, value) {
      languageJson[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] = languageJson;
  }
  return languages;
}
