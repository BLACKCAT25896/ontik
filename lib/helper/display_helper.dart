import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helper/responsive_helper.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


void customPrint(String message) {
  if(kDebugMode) {
    print(message);
  }
}

Future<String?> pickDate(BuildContext context,{DateTime? selectedDate}) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: selectedDate??DateTime.now(),
    firstDate: DateTime.now().subtract(const Duration(hours: 12)),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
    return formattedDate;
  }else{
    return null;
  }
}

Future<String?> pickTime(BuildContext context,{TimeOfDay? selectedTime}) async {
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: selectedTime?? TimeOfDay.now(),
  );
  if(pickedTime != null){
    String time ="${pickedTime.hour}:${pickedTime.minute}";
    DateTime dateTime = DateFormat('HH:mm').parse(time);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }
  return null;
}

void showCustomSnackBar(String message, {bool isError = true, bool getXSnackBar = false, int seconds = 3}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.horizontal,
    margin: const EdgeInsets.all(Dimensions.paddingSizeSmall).copyWith(
      right: ResponsiveHelper.isDesktop ? Get.context!.width*0.7 : Dimensions.paddingSizeSmall,
    ),
    duration: Duration(seconds: seconds),
    backgroundColor: isError ? Colors.red : Colors.green,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
    content: Text(message, style: textMedium.copyWith(color: Colors.white)),
  ));
}

String getGreetingMessage() {
  final now = DateTime.now();
  final hour = now.hour;
  const morningStart = 5;
  const afternoonStart = 12;
  const eveningStart = 17;

  if (hour >= morningStart && hour < afternoonStart) {
    return 'Good Morning';
  } else if (hour >= afternoonStart && hour < eveningStart) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}

