
import 'package:food_dose/view/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
  {


  @override
  void initState() {
    super.initState();
    _navigatetowelcomePage();
  }


  _navigatetowelcomePage() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = Get.size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 250,
            ),
          ),
        
        ],
      ),
    );
  }
  }