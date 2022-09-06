import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ktext_feild.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool ?obscure;
  final Widget? suffixIcon;
  const CustomTextFieldContainer({
    @required this.hintText,
    this.controller,
    this.obscure,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5,horizontal: 25),
      child: Container(
        height: 45,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50.0)),
        child: TextFormField(
          // obscureText: obscure,
          controller: controller,
          validator: (value) {
            if (controller!.text.isEmpty) {
              return "This field can't be empty";
            }

            return null;
          },
          cursorColor: Colors.black54,
          decoration: ktextFieldDecoration.copyWith(
          
            hintText: hintText!,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}