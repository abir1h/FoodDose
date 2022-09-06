import 'package:food_dose/Utility/colors..dart';
import 'package:food_dose/view/order-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:sizer/sizer.dart';

class Success extends StatefulWidget {
  final String title;
  const Success({Key? key, required this.title}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
                size: 150,
            ),
            SizedBox(height: 10,
            ),
            Text("Thank You. ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: appColors.blactText
              ),
            ),
            SizedBox(height: 10,
            ),
            Text("Your Order is submited success.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: appColors.blactText
              ),
            ),
            SizedBox(height: 20,),
            Bounce(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderList())),
              duration: Duration(milliseconds: 80),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: appColors.mainColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child:Text("Track Order",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
