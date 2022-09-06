import 'package:food_dose/Utility/colors..dart';
import 'package:flutter/material.dart';

import '../view/cart_screen.dart';
import '../view/home-screen.dart';
import '../view/profile_screen.dart';

class AppBottomNavigation extends StatefulWidget {
  final int index;
  const AppBottomNavigation({Key? key, this.index = 0}) : super(key: key);

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  late int _CurrentIndex;
  initState(){
    super.initState();
    _CurrentIndex = widget.index;
  }
  List screen = [
    HomeScreen(),
    Cart(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screen[_CurrentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _CurrentIndex,
        selectedItemColor: appColors.mainColor,

        onTap: (index){
          setState(()=>_CurrentIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
