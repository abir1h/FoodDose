import 'package:flutter/material.dart';

import '../view/setting_page.dart';
import 'buttom-navigation.dart';

 AppBar customAppBar(BuildContext context,
{ IconData leftIcon = Icons.settings, bool isAcction = false, bool isTitle = false}){

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black,),
      onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigation())),
    ),
    title: isTitle ? Text("Select Your Address"):Center(),

    actions: [
      isAcction ?  Padding(padding: EdgeInsets.only(right: 20, top: 10, bottom: 10),
        child: IconButton(
          icon: Icon(leftIcon, color: Colors.black,),
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage())),
        ),
      ): Container(),
    ],
  );
}