import 'package:flutter/material.dart';

Widget? suffixIcon;

final ktextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle:  TextStyle(
    color:Colors.black54,
  ),
  suffixIcon: suffixIcon,
  contentPadding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  enabledBorder:  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  focusedBorder:  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey,width: 2),
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
);