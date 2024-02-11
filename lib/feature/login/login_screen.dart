import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/controller/home_controller.dart';
import 'package:flutter_boilerplate/feature/home/view/home_screen_view.dart';
import 'package:flutter_boilerplate/helper/route_helper.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/images.dart';
import 'package:flutter_boilerplate/util/styles.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({super.key});

  @override
  State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (homeController) {
          return Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [

            InkWell(onTap: () async {
              homeController.googleLogin();
             Get.toNamed(RouteHelper.home);

            },
              child: Container(width: Get.width * 1.5, padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: Row(mainAxisAlignment : MainAxisAlignment.center, children: [
                  SizedBox(width: 30,child: Image.asset(Images.googleLogin)),
                  const SizedBox(width: Dimensions.paddingSizeDefault),
                  Text("Login with Google",
                    style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).hintColor),)
                ],),
              ),
            )
          ],);
        }
      ),
    );
  }
}
