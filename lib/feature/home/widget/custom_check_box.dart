import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool)  onChanged;
  const CustomCheckBox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()=>onChanged(!value),
        child: AnimatedCrossFade(
            excludeBottomFocus: true,
            sizeCurve: Curves.easeIn,
            firstChild: Icon(Icons.check_circle_rounded,color: Get.theme.primaryColor,size: 35,),
            secondChild: Icon(Icons.circle_outlined,color: Get.theme.primaryColor,size: 35,),
            crossFadeState:value ? CrossFadeState.showFirst : CrossFadeState.showSecond ,
            duration: const Duration(milliseconds: 500))
    );
  }
}