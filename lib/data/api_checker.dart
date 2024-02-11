import 'package:flutter_boilerplate/common/widget/custom_snackbar.dart';
import 'package:flutter_boilerplate/data/error_response.dart';
import 'package:get/get.dart';


class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {


    }else if(response.statusCode == 403){
      ErrorResponse errorResponse;
      errorResponse = ErrorResponse.fromJson(response.body);
      if(errorResponse.errors != null && errorResponse.errors!.isNotEmpty){
        showCustomSnackBar(errorResponse.errors![0].message!);
      }else{
        showCustomSnackBar(response.body['message']!);
      }

    }else {
      showCustomSnackBar(response.statusText!);
    }
  }
}
