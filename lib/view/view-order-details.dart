import 'package:food_dose/Utility/colors..dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:status_change/status_change.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: appColors.blactText,),
        ),
        title: Text("Order Reports", style: TextStyle(color: appColors.blactText),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order No. #129H49823hHEU",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,

              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price: \$39.0",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: appColors.mainColor

                  ),
                ),
                Text("QTY: 4",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      color: appColors.mainColor

                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: appColors.mainColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(Icons.check_circle, color: Colors.white,),
                ),
                SizedBox(width: 10,),

                Text("Pending",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,

                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: appColors.white,
                    border: Border.all(width: 5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  // child: Icon(Icons.check_circle, color: Colors.white,),
                ),
                SizedBox(width: 10,),

                Text("Processing",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      color: Colors.grey

                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: appColors.white,
                    border: Border.all(width: 5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  // child: Icon(Icons.check_circle, color: Colors.white,),
                ),
                SizedBox(width: 10,),

                Text("Shipping",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: Colors.grey

                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: appColors.white,
                    border: Border.all(width: 5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  // child: Icon(Icons.check_circle, color: Colors.white,),
                ),
                SizedBox(width: 10,),

                Text("Delivery",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      color: Colors.grey

                  ),
                )
              ],
            ),


          ],

        ),
      ),
    );
  }
}
