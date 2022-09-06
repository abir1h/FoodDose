// import 'package:dosse/src/config/ktext.dart';
// import 'package:dosse/src/pages/details_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OfferPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//         final Size size = Get.size;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: KText(
//           text: 'Offers',
//           color: Colors.black,
//           fontSize: 16,
//         ),
//       ),
//       body: Column(
//         children: [
//           Divider(
//             color: Colors.grey[450],
//             thickness: 0.5,
//           ),
//           KText(text: ''),
//           Divider(
//             color: Colors.grey[450],
//             thickness: 0.5,
//           ),
//          GestureDetector (
//            onTap: ()=>Get.to(DetailsPage()),
//             child: Container(
//               height: 320,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(.3),
//                         offset: const Offset(
//                           5.0,
//                           5.0,
//                         ),
//                         blurRadius: 10.0,
//                         spreadRadius: 2.0,
//                       ), 
//                 ]
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                  Container(
//                    height: 200,
//                    width: double.infinity,
//                    decoration: BoxDecoration(
//                      image: DecorationImage(image: AssetImage('assets/kabab.jpg',),fit: BoxFit.fill,),
//                    ),
//                    child: Stack(
//                      children: [
//                        Positioned(
//                          top: size.height*0.10,
//                          left: 15,
//                          child: Container(
//                          height: 50,
//                          width: 50,
//                          decoration: BoxDecoration(
//                            color: Colors.grey,
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(image: AssetImage('assets/logo.png'),fit:BoxFit.fill ,)
//                          ),
//                        ),
//                        ),
//                     Positioned(  
//                             top: size.height * 0.17,
//                             child: Container(
//                                 height: 50,
//                                 width: size.width * 0.20,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xffF5591F),
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(50),
//                                       bottomRight: Radius.circular(50)),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 15,),
//                                     KText(
//                                       text: '20',
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 25,
//                                     ),
//                                     KText(
//                                       text: '%\nOFF',
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12,
//                                     ),
//                                   ],
//                                 ),),
//                           ),
//                      ],
//                    ),
//                  ),
//                  SizedBox(height: 10,),
//                  Padding(
//                    padding:  EdgeInsets.only(left: 15),
//                    child: KText(text: '40 days 8 hours 8 minites',color: Color(0xffF5591F),fontSize: 12,),
//                  ),
//                  Padding(
//                    padding:  EdgeInsets.only(left: 15),
//                    child: KText(text: '20% OFF (PancauriCafe-keraniganj)',color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
//                  ),
//                    Divider(
//                   color: Colors.grey[450],
//                   thickness: 0.5,
//                 ),
//                 Padding(
//                   padding:  EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       KText(text: 'Dhakaiya Kabab .'),
//                       KText(text: 'tK.385 .'),
//                       KText(text: '29 min.'),
//                      SizedBox (
//                        height: 50,
//                        width: size.width*0.25,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xffF5591F),
//                           ),
//                           onPressed: (){
//                             Get.to(DetailsPage());
//                           }, 
//                           child: KText(text: 'ORDER',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,)
//                           ),
//                       )
          
//                     ],
//                   ),
//                 )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }