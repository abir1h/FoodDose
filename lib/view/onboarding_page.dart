
import 'package:food_dose/view/select_address.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnboardPage extends StatelessWidget {

  ///Changed a little bit of buttons styling and text for the thumbnail lol
  ///Thanks for coming here :-)
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Connect With Everyone',
      body: 'Here you can have whatever description you would like to have, you can type it all in here',
      image: Image.asset('assets/onboard.png'),
      decoration:  PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        )
      )
    ),
    PageViewModel(
        title: 'Have Access Everywhere!',
        body: 'Here you can have whatever description you would like to have, you can type it all in here',
        
        image: Image.asset('assets/onboard.png'),
        decoration:  PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'Here We Start!',
        body: 'Here you can have whatever description you would like to have, you can type it all in here',
      
        image: Image.asset('assets/onboard.png'),
        decoration:  PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        dotsDecorator:  DotsDecorator(
        
          
          size: Size(15,10),
          color: Colors.blue,
          activeSize: Size(10, 10),
          activeColor: Colors.red,
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
        ),
        showDoneButton: true,
        done:  Text('Done', style: TextStyle(fontSize: 20),),
        showSkipButton: true,
        skip:  Text('Skip', style: TextStyle(fontSize: 20),),
        showNextButton: true,
        next:  Icon(Icons.arrow_forward, size: 25,),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Get.to(()=>SelectNewAddress());
  }
}