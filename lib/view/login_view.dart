// import 'package:dosse/src/config/ktext.dart';
// import 'package:dosse/src/pages/login_page.dart';
// import 'package:dosse/src/pages/signin_page.dart';
// import 'package:dosse/src/widget/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class LoginView extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = Get.size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: [
//           SizedBox(height: size.height*0.10,),
//           Center(child: Image.asset('assets/logo.png',width: 200,)),
//           Center(child: KText(text: 'চলে,সময়ের সাথে সাথে',fontSize: 12,)),
//           SizedBox(height: size.height*0.05,),
//           CustomButton(buttonText: 'লগইন করুন', width: size.width*0.75, onpressed: (){
//             Get.to(LoginPage());
//           }, color: Colors.white,),
//           SizedBox(height: 20,),
//           CustomButton(buttonText: 'রেজিস্ট্রেশন করুন', width: size.width*0.75, onpressed: (){
//             Get.to(SigninPage());
//           }, color: Colors.white,color2: Colors.white,),
//           SizedBox(height: size.height*0.35,),
//           KText(text: 'Powerd By:',color: Colors.white ,),
//           Image.asset('assets/logo.png',width: 120,),
//           Padding(
//             padding:  EdgeInsets.only(left: 40),
//             child: KText(text: 'Design Your Dreams',fontSize: 7,),
//           ),
//         ],
//       ),
//     );
//   }
// }