

import 'dart:ui';

import 'package:food_dose/view/onboarding_page.dart';
import 'package:food_dose/view/setting_page.dart';
import 'package:food_dose/widget/app-bar.dart';
import 'package:food_dose/widget/buttom-navigation.dart';
import 'package:food_dose/widget/custome-loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(context, isAcction: true, leftIcon: Icons.settings),
      body: Column(
        children: [
          Stack(
            children: [

              Container(
                width: width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/carousel/img.jpg"),
                    fit: BoxFit.cover
                  )
                ),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 2),
                child: Text(""),
              ),
              ),
              Container(
                width: width,
                height: 200,
                color: Colors.black.withOpacity(0.4),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/images/r.png", height: 100, width: 100, fit: BoxFit.cover,),
                ),
              ),

              Positioned(
                bottom: 45,
                left: width/3,
                right: width/3,
                child: Center(
                  child: Text("MD: NAYON",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Positioned(
                left: width/4,
                right: width/4,bottom: 10,
                child: SizedBox(
                  width: 150,
                  child: Text("barisla, Prirojpur, Bhnadaria, Nadmulla -8550.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 9.sp,
                      color: Colors.white
                    ),
                  ),
                ),
              ),


            ],
          ),


          SizedBox(height: 30,),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                customeItems(icon: Icon(Icons.list_alt_outlined,color: Colors.black,), text: 'Your orders'),
                //customeItems(icon: Icon(Icons.local_offer_outlined,color: Colors.black,), text: 'Offers',onClicked: ()=>Get.to(OfferView())),
                customeItems(icon: Icon(Icons.notifications,color: Colors.black,), text: 'Notifications'),
                customeItems(icon: Icon(Icons.favorite_border_outlined,color: Colors.black,), text: 'Favorite'),
                customeItems(icon: Icon(Icons.favorite_border_outlined,color: Colors.black,), text: 'Chat Box'),
                customeItems(icon: Icon(Icons.info_outline,color: Colors.black,), text: 'About'),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
      //bottomNavigationBar: AppBottomNavigation(),
    );
  }
}