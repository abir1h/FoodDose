import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customeItems({
  required Widget icon,
  required String text,
  VoidCallback? onClicked,
}) {
  return InkWell(
    onTap: onClicked,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 56,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: ListTile(
          leading: icon,
          title: Text(text.toString(),
              style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold)),
        ),
      ),
    ),
  );
}
