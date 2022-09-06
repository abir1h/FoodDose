import 'package:food_dose/Utility/colors..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  final String text;
  const AppButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF96D8FF).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
        borderRadius:BorderRadius.circular(5),
        color: appColors.mainColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$text",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),

          ),
          Icon(
            Icons.arrow_right_alt,
            size: 30,
          )
        ],
      ),
    );
  }
}
