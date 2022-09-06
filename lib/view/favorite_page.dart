

// import 'package:dosse/src/config/ktext.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FavoritePage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//         final Size size = Get.size;

//     return Scaffold(
//       backgroundColor: Colors.white,
//           appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: KText(
//           text: 'My Favourites',
//           color: Colors.black,
//           fontSize: 16,
//         ),
//       ),
//       body: Column(
//         children: [
//             Divider(
//             color: Colors.grey[450],
//             thickness: 0.5,
//           ),
//           KText(text: ''),
//           Divider(
//             color: Colors.grey[450],
//             thickness: 0.5,
//           ),
//              Container(
//               height:300,
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 primary: false,
//                 itemCount: 1,
//                 separatorBuilder: (context ,index)=> SizedBox(height: 5,),
//                 itemBuilder: (context, index){
//                   return Container(
//                 margin: EdgeInsets.all( 10),
//                 height: 300,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
//                 ),
//                 child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
//                     child: Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
//                       image: DecorationImage(image: AssetImage('assets/kabab.jpg'),fit: BoxFit.cover),
//                       ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             top: 15,
//                             right: 10,
//                             child: Container(
//                             height: 45,
//                             width: 45,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color:  Color(0xffF5591F),size: 30,)),),
//                           )),
//                         ],
//                       ),
//                       ),
//                   ),
//                   SizedBox(height: 20,),
      
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       children: [
//                        ClipRRect (
//                          borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               image: DecorationImage(image: AssetImage('assets/kabab.jpg'),fit: BoxFit.cover),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10,),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           KText(text: 'PankauriCafe-Kearniganj',color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,),
//                           KText(text: 'Indian',color: Colors.black,fontSize: 12,),
//                         ],
//                       ),
//                       SizedBox(width: 50,),
//                       Container(
//                         height: 15,
//                         width: 15,
//                         decoration: BoxDecoration(
//                           color: Color(0xffF5591F),
//                         ),
//                         child: Icon(Icons.star_border,size: 12,color: Colors.white,),
//                       ),
                       
//                       KText(text: '3.6',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12,),
                     
//                       KText(text: '(76)'),
//                       ],
//                     ),
//                   ),

//                   Padding(
//                     padding:  EdgeInsets.only(left: size.width*0.15),
//                     child: Row(
//                     children: [
//                       Icon(Icons.time_to_leave_outlined,color: Color(0xffF5591F),),
//                       SizedBox(width: 5,),
//                       KText(text: '34 min'),
//                       SizedBox(width: size.width*0.20,),
//                       Icon(Icons.money,color: Color(0xffF5591F),),
//                       SizedBox(width: 5,),
//                       KText(text: 'TK.29'),
//                     ], 
//                     ),
//                   )     
//                 ],
//                 ),
//               );
//                 }, 
                
//                 ),
//             ),
//         ],
//       ),
//     );
//   }
// }