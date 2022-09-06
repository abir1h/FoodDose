import 'package:food_dose/Utility/colors..dart';
import 'package:food_dose/view/address_list.dart';
import 'package:food_dose/view/home-screen.dart';
import 'package:food_dose/view/order-success.dart';
import 'package:food_dose/view/profile_screen.dart';
import 'package:food_dose/view/select_address.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: appColors.blactText,),
        ),
        title: Text("Your Cart", style: TextStyle(color: appColors.blactText),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: width,
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 2, color: Colors.grey.shade200, )
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset("assets/images/f1.jpeg",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width*.5,
                                child: Text("Chicken Berger",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: appColors.blactText
                                  ),
                                ),
                              ),

                              InkWell(
                                  onTap: (){},
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.grey.shade400,
                                    size: 30,
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width/2.8,
                                child: Text("\$230.90",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: appColors.mainColor
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Bounce(
                                      onPressed: (){},
                                      duration: Duration(milliseconds: 80),
                                      child: Container(
                                        color: Colors.grey.shade200,
                                        child: Icon(
                                          Icons.add,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                                        color: Colors.white,
                                        child: Text("1")
                                    ),
                                    Bounce(
                                      onPressed: (){},
                                      duration: Duration(milliseconds: 80),
                                      child: Container(
                                        color: Colors.grey.shade200,
                                        child: Icon(
                                          Icons.remove,
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              )

                            ],
                          ),
                        ],
                      )

                    ],
                  ),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 2, color: Colors.grey.shade200, )
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset("assets/images/f1.jpeg",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width*.5,
                                child: Text("Chicken Berger",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: appColors.blactText
                                  ),
                                ),
                              ),

                              InkWell(
                                  onTap: (){},
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.grey.shade400,
                                    size: 30,
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width/2.8,
                                child: Text("\$230.90",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: appColors.mainColor
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Bounce(
                                      onPressed: (){},
                                      duration: Duration(milliseconds: 80),
                                      child: Container(
                                        color: Colors.grey.shade200,
                                        child: Icon(
                                          Icons.add,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                                        color: Colors.white,
                                        child: Text("1")
                                    ),
                                    Bounce(
                                      onPressed: (){},
                                      duration: Duration(milliseconds: 80),
                                      child: Container(
                                        color: Colors.grey.shade200,
                                        child: Icon(
                                          Icons.remove,
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              )

                            ],
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 50,),

            DottedBorder(
              color: Colors.grey,
              strokeWidth: 1,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipping Address:",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF9B9B9B)
                          ),
                        ),

                        SizedBox(height: 20,),
                        Text("xxxxxxxxxxxxxxxxxxxx",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    Bounce(
                      onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectNewAddress())),
                      duration: Duration(milliseconds: 80),
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: appColors.mainColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            Text("Change",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 40,),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Items (1)",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: appColors.blactText,
                      ),
                    ),

                    Text("\$500.56",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: appColors.blactText,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shopping",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: appColors.blactText,
                      ),
                    ),

                    Text("\$40.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: appColors.blactText,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Divider(height: 1,color: Colors.grey.shade400,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Price",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                        color: Colors.black,
                      ),
                    ),

                    Text("\540.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: appColors.mainColor,
                      ),
                    )
                  ],
                ),
              ],
            ),


            SizedBox(height: 40,),
            Bounce(
              duration: Duration(milliseconds: 80),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Success(title: "title"))),
              child: Container(
                width: 100,
                height: 50,
                margin: EdgeInsets.only(left: width*.10, bottom: 50, right: width*.10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: appColors.mainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text("CHECKOUT",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
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
