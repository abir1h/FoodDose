// // ignore_for_file: non_constant_identifier_names
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class OfferView extends StatefulWidget {
//
//   @override
//   State<OfferView> createState() => _OfferViewState();
// }
//
// class _OfferViewState extends State<OfferView> {
//   @override
//   Widget build(BuildContext context) {
//     List<ListModel>OfferView=[
//       ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//          ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//        ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//        ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//        ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//        ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//        ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//        ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//        ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//        ListModel(
//         image: 'assets/burger.png',
//         text1: 'Get 20% off on selected  items',
//         text2: 'Valid untill 26 June,2020',
//         text3: 'Adora Sweet',
//       ),
//
//     ];
//    return Scaffold(
//             backgroundColor: Colors.white,
//
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0,
//        leading: IconButton(onPressed: (){
//       Get.back();
//        }, icon: Icon(Icons.arrow_back,size: 30,color: Colors.black,)),
//        centerTitle: true,
//        title: KText(text: 'Offers',color: Colors.black,fontSize:18,fontWeight: FontWeight.bold,)
//      ),
//      body: SingleChildScrollView(
//        child: Container(
//          height: 850,
//              child: ListView.separated(
//                separatorBuilder: (context, index) => Divider(color: Colors.grey.withOpacity(.3),thickness: .5,),
//                itemCount: OfferView.length,
//                itemBuilder: (context,index){
//                  return Container(
//                 margin: EdgeInsets.only(left: 20,right: 20),
//                 height: 120,
//                 width: double.infinity,
//
//                 decoration: BoxDecoration(
//
//
//                ),
//                 child: Row(
//                   children: [SizedBox(width: 10,),
//                     Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.withOpacity(.3),width: 0.5),
//                         borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: Image.asset('${OfferView.elementAt(index).image!}',height: 80,width: 80,)),
//                     SizedBox(width: 10,),
//                     Container(padding: EdgeInsets.only(top:15),
//          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//               Text('${OfferView.elementAt(index).text1!}',
//               style: TextStyle(
//                 fontSize: 15,
//               ),),
//               SizedBox(height: 10,),
//               Text('${OfferView.elementAt(index).text2!}', style: TextStyle(
//                 fontSize: 12,
//               ),),
//               SizedBox(height: 10,),
//               Text('${OfferView.elementAt(index).text3!}', style: TextStyle(
//                     fontSize: 12,
//                   ),),
//
//          ],
//          ),
//                     ),
//
//                   ],
//                 ),
//               );
//
//                }
//                ),
//            ),
//
//
//        ),
//      );
//
//
//
//   }
// }