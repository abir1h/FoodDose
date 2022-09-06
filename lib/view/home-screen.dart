import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_dose/Utility/AppUrl.dart';
import 'package:food_dose/Utility/colors..dart';
import 'package:food_dose/app_config.dart';
import 'package:food_dose/view/category-product.dart';
import 'package:food_dose/view/login_page.dart';
import 'package:food_dose/view/select_address.dart';
import 'package:food_dose/view/setting_page.dart';
import 'package:food_dose/view/signle_foods.dart';
import 'package:food_dose/view/single-cateogry-product.dart';
import 'package:food_dose/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List sliderList = [
    "assets/images/s1.png",
    "assets/images/s2.png",
    "assets/images/s3.png",
  ];
  late List categoryselect = [];
  int _curentPage  = 1;

  var userLat;
  var userLng;
  var userFullAddress;

  bool isLocation = false;
  List resLocation = [];
  //init
  @override
  void initState() {
    // TODO: implement initState
    UserLocation();
    banner=get_banners();
  }
  void UserLocation()async{
    SharedPreferences localStore = await SharedPreferences.getInstance();
   var lat = localStore.getString("lat");
   var lng = localStore.getString("lat");
   var fulladdress = localStore.getString("full_address");
   setState(() {
      userLat = lat;
      userLng = lng;
      userFullAddress = fulladdress;
   });
    getResturentFuture = getResturent();
  }

  //show resturent
  late Future getResturentFuture;
   getResturent()async{
    var response = await http.get(Uri.parse("${AppConfig.resturent}?latitude=23.7896645&longitude=90.371166&distance=10"));
    print(response.statusCode);
    print(response.body);
    var data = jsonDecode(response.body)["restaurants"];
    if(response.statusCode == 200){
      print(data);
      return data;
    }
    return data;


  }
  Future get_banners() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'authorization': "Bearer $token"
    };

    var response = await http.get(Uri.parse(AppUrl.banner),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      print('Get post collected' + response.body);
      var userData1 = jsonDecode(response.body)['allBanner'];

      return userData1;
    } else {
      print("post have no Data${response.body}");
      var userData1 = jsonDecode(response.body)['allBanner'];
      return userData1;
    }
  }
  Future? banner;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
       body: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               width: width,
               padding: EdgeInsets.all(5),
               decoration: BoxDecoration(
                 color: Colors.white,
                 // boxShadow: [
                 //   BoxShadow(
                 //     blurRadius:5,
                 //     spreadRadius: 1,
                 //     offset: Offset(0,2),
                 //     color: Colors.grey.shade200
                 //   )
                 // ],
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   InkWell(
                     onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectNewAddress())),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Icon(
                           Icons.location_on_outlined,
                           size: 35,
                           color: appColors.mainColor,
                         ),
                         SizedBox(width: 10,),
                         SizedBox(width: width/1.6,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Delivery to", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 9.sp, color: Colors.grey),),
                               Row(
                                 children:  [
                                   Flexible(
                                       child: Text(
                                         userFullAddress != null? userFullAddress.toString():"Locating...", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp, color: appColors.blactText),)),
                                   Icon(
                                     Icons.arrow_drop_down,
                                     size: 20,
                                   )
                                 ],
                               )
                             ],
                           ),
                         )
                       ],
                     )
                   ),
                   IconButton(
                       onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage())),
                       icon: Icon(Icons.person_outline, size: 30, color:appColors.mainColor,)),
                 ],
               ),
             ),
             Container(
               width: width,
               padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
               decoration: BoxDecoration(
                 color: appColors.mainColor.withOpacity(0.1),
                 // boxShadow: [
                 //   BoxShadow(
                 //       blurRadius:5,
                 //       spreadRadius: 1,
                 //       offset: Offset(0,2),
                 //       color: Colors.grey.shade200
                 //   )
                 // ],
               ),
               child: RichText(
                   text: TextSpan(
                       children: [
                         TextSpan(
                             text: "#FOODDOSS34 ",
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 10.sp,
                                 color: appColors.mainColor
                             )
                         ),

                         TextSpan(
                             text: "Use this code to get 45% Discount",
                             style: TextStyle(
                                 fontWeight: FontWeight.w400,
                                 fontSize: 10.sp,
                                 color: appColors.mainColor
                             )
                         )
                       ]
                   )),
             ),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.only(left: 20, right: 20),
                 child: ListView(
                   children: [
                     //buildIsLogin(width),
                     SizedBox(height: 10,),
                     Container(
                         child: FutureBuilder(
                             future: banner,
                             builder: (_, AsyncSnapshot snapshot) {
                               print(snapshot.data);
                               switch (snapshot.connectionState) {
                                 case ConnectionState.waiting:
                                   return SizedBox(
                                     width: MediaQuery.of(context).size.width,
                                     height: MediaQuery.of(context).size.height,
                                     child: Shimmer.fromColors(
                                       baseColor: Colors.grey.withOpacity(.3),
                                       highlightColor: Colors.grey.withOpacity(.1),
                                       child: ListView.builder(
                                         physics: AlwaysScrollableScrollPhysics(),
                                         itemBuilder: (_, __) => Padding(
                                           padding: const EdgeInsets.only(bottom: 8.0),
                                           child: Row(
                                             crossAxisAlignment:
                                             CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Container(
                                                 width: 48.0,
                                                 height: 48.0,
                                                 color: Colors.white,
                                               ),
                                               const Padding(
                                                 padding: EdgeInsets.symmetric(
                                                     horizontal: 8.0),
                                               ),
                                               Expanded(
                                                 child: Column(
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.start,
                                                   children: <Widget>[
                                                     Container(
                                                       width: double.infinity,
                                                       height: 8.0,
                                                       color: Colors.white,
                                                     ),
                                                     const Padding(
                                                       padding: EdgeInsets.symmetric(
                                                           vertical: 2.0),
                                                     ),
                                                     Container(
                                                       width: double.infinity,
                                                       height: 8.0,
                                                       color: Colors.white,
                                                     ),
                                                     const Padding(
                                                       padding: EdgeInsets.symmetric(
                                                           vertical: 2.0),
                                                     ),
                                                     Container(
                                                       width: 40.0,
                                                       height: 8.0,
                                                       color: Colors.white,
                                                     ),
                                                   ],
                                                 ),
                                               )
                                             ],
                                           ),
                                         ),
                                         itemCount: 6,
                                       ),
                                     ),
                                   );
                                 default:
                                   if (snapshot.hasError) {
                                     Text('Error: ${snapshot.error}');
                                   } else {
                                     return snapshot.hasData
                                         ? snapshot.data.length > 0
                                         ? Column(
                                       children: [
                                         Container(
                                           child: CarouselSlider.builder(
                                             itemCount: snapshot.data.length,
                                             itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                                                 Container(
                                                   child: Stack(
                                                     children: [
                                                       Container(
                                                         width: width,
                                                         height: 130,
                                                         decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(10),
                                                             image: DecorationImage(
                                                               image: NetworkImage( Appusnapshot.data[itemIndex]['image'],),
                                                               fit: BoxFit.cover,
                                                             )
                                                         ),

                                                       )
                                                     ],
                                                   ),
                                                 ),
                                             options: CarouselOptions(
                                               aspectRatio: 16/6,
                                               viewportFraction: 0.8,
                                               initialPage: 0,
                                               enableInfiniteScroll: true,
                                               reverse: false,
                                               autoPlay: true,
                                               autoPlayInterval: Duration(seconds: 3),
                                               autoPlayAnimationDuration: Duration(milliseconds: 800),
                                               autoPlayCurve: Curves.fastOutSlowIn,
                                               enlargeCenterPage: true,
                                               scrollDirection: Axis.horizontal,
                                               onPageChanged: (index, reason) {
                                                 setState(() {
                                                   _current = index;
                                                 });
                                               },
                                             ),
                                           ),
                                         ),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: sliderList.asMap().entries.map((entry) {
                                             return GestureDetector(
                                               onTap: () => _controller.animateToPage(entry.key),
                                               child: Container(
                                                 width: 12.0,
                                                 height: 12.0,
                                                 margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                                 decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                     color: (Theme.of(context).brightness == Brightness.dark
                                                         ? Colors.white
                                                         : appColors.mainColor)
                                                         .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                                               ),
                                             );
                                           }).toList(),
                                         ),
                                       ],
                                     )
                                         : Center(
                                         child: Column(
                                           children: [
                                             SizedBox(
                                               height: height / 10,
                                             ),
                                             Text('No Post Yet!!')
                                           ],
                                         ))
                                         : Text('No data');
                                   }
                               }
                               return CircularProgressIndicator();
                             })),
                     SizedBox(height: 20,),

                     Row(
                       children: [
                         Container(
                           width: 7,
                           height: 20,
                           color: appColors.mainColor,
                         ),
                         SizedBox(width: 5,),
                         Text("Categories",
                           style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: 14.sp,
                               color: appColors.blactText
                           ),
                         ),
                       ],
                     ),
                     Container(
                       width: width,
                       height: 60,
                       child: ListView.separated(
                         scrollDirection: Axis.horizontal,
                         itemCount: 10,
                         itemBuilder: (context, index){
                           return Bounce(
                             onPressed: (){
                               setState(() {
                                 categoryselect.clear();
                                 categoryselect.add(index);
                               });
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleCategoryProduct(Category: "Category Name")));
                             },
                             duration: Duration(milliseconds: 80),
                             child: Container(
                               height: 50,
                               margin: EdgeInsets.all(5),
                               padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                               decoration: BoxDecoration(
                                 color:  categoryselect.isNotEmpty && categoryselect[0] == index? appColors.mainColor: appColors.white,
                                 borderRadius: BorderRadius.circular(100),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.shade200,
                                     blurRadius: 20,
                                     spreadRadius:2,
                                   )
                                 ],
                               ),
                               child: Row(
                                 children: [
                                   ClipRRect(
                                     borderRadius: BorderRadius.circular(100),
                                     child: Image.asset("assets/category/c1.jpeg", height: 50, width: 50, fit: BoxFit.cover,),
                                   ),

                                   Text("Category Name",
                                     style: TextStyle(
                                       fontSize: 12.sp,
                                       fontWeight: FontWeight.w400,
                                       color: categoryselect.isNotEmpty && categoryselect[0] == index?appColors.white: appColors.mainColor,
                                     ),
                                   )
                                 ],
                               ),
                             ),
                           );
                         }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5,),
                       ),
                     ),
                     //buildHomeCategory(width),




                     SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Container(
                               width: 7,
                               height: 20,
                               color: appColors.mainColor,
                             ),
                             SizedBox(width: 5,),
                             Text("Most Popular Foods",
                               style: TextStyle(
                                   fontWeight: FontWeight.w700,
                                   fontSize: 14,
                                   color: appColors.blactText
                               ),
                             ),
                           ],
                         ),
                         TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductList()))
                             , child: Text("SEE ALL"))
                       ],
                     ),
                     buildMostPopular(width),

                     SizedBox(height: 20,),
                     //banner
                     Container(
                       width: width,
                       height: 120,
                       decoration: BoxDecoration(
                           image: DecorationImage(
                             image: AssetImage("assets/images/s2.png"),
                             fit: BoxFit.cover,
                           )
                       ),
                     ),

                     SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Container(
                               width: 7,
                               height: 20,
                               color: appColors.mainColor,
                             ),
                             SizedBox(width: 5,),
                             Text("Most Popular Restaurant",
                               style: TextStyle(
                                   fontWeight: FontWeight.w700,
                                   fontSize: 14,
                                   color: appColors.blactText
                               ),
                             ),
                           ],
                         ),
                         TextButton(onPressed: (){}, child: Text("SEE ALL"))
                       ],
                     ),
                     buildHomeResturents(width),
                   ],
                 ),
               ),
             ),
           ],
         ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: appColors.mainColor,
          onPressed: (){},
          child: Icon(Icons.chat_bubble_outline, color: Colors.white,),
        ),

      ),
    );
  }

  Container buildHomeResturents(double width) {
    return Container(
             width: width,
             height: 200,
             margin: EdgeInsets.only(bottom: 20),
             child: FutureBuilder(
               future: getResturentFuture,
               builder: (_, AsyncSnapshot<dynamic> snapshot){
                 print(snapshot.data.length);
                 if(snapshot.connectionState == ConnectionState.waiting){
                   return ListView.builder(
                       padding: EdgeInsets.only(top: 20, bottom: 20),
                       scrollDirection: Axis.horizontal,
                       itemCount: snapshot.data.length,
                       itemBuilder: (context, index){
                         return Shimmer.fromColors(
                           baseColor: Colors.white,
                           highlightColor: Colors.grey.shade200,
                           child: Container(
                             height: 150,
                             width: width/1.3,

                             margin: EdgeInsets.only(left: 10, right: 10),
                             decoration: BoxDecoration(
                               // color: appColors.white,
                               borderRadius: BorderRadius.circular(10),

                             ),
                           ),
                         );
                       }
                   );
                 }else if(snapshot.hasData){
                   return ListView.builder(
                       padding: EdgeInsets.only(top: 20, bottom: 20),
                       scrollDirection: Axis.horizontal,
                       itemCount: snapshot.data.length,
                       itemBuilder: (context, index){
                         var lat = snapshot.data[0]["location"]["coordinates"][0];
                         var lng = snapshot.data[0]["location"]["coordinates"][1];
                         getAddressFromLatLng(context,lat, lng, index);

                         var url = "https://fooddoose.payrapay.com/public/uploads/";
                         return Container(
                           height: 150,
                           width: width/1.3,

                           margin: EdgeInsets.only(left: 10, right: 10),
                           decoration: BoxDecoration(
                             // color: appColors.white,
                             borderRadius: BorderRadius.circular(10),

                           ),
                           child: Stack(
                             children: [
                               ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.network('https://fooddoose.payrapay.com/public/uploads/${snapshot.data[index]["image"]}',
                                   height: 150,
                                   width: width/1.3,
                                   fit: BoxFit.cover,
                                 ),
                               ),
                               Container(
                                 height: 150,
                                 width: width/1.3,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: appColors.blactText.withOpacity(0.5),
                                 ),
                               ),
                               // Positioned(
                               //   right: 10, top: 10,
                               //   child: Container(
                               //     padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                               //     decoration: BoxDecoration(
                               //       borderRadius: BorderRadius.circular(10),
                               //       color: appColors.mainColor,
                               //     ),
                               //     child: Center(child: Text("4.5*", style: TextStyle(color: Colors.white),)),
                               //   ),
                               // ),
                               Positioned(
                                 top: 80,
                                 left: 10,
                                 child: Text("${snapshot.data[index]["shopName"]}",
                                   style: TextStyle(
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                     color: Colors.white,
                                   ),
                                 ),
                               ),
                               Positioned(
                                 top: 105,
                                 left: 10,
                                 child: Row(
                                   children: [
                                     Icon(
                                       Icons.location_on_outlined,
                                       color: Colors.white70,
                                       size: 20,
                                     ),
                                     SizedBox(width: 2,),
                                     Container(
                                       width: width*.50,
                                       child: Text("F2QM+HP2, Barisal - Pirojpur Hwy, Bhitabaria",
                                         style: TextStyle(
                                           fontSize: 10,
                                           fontWeight: FontWeight.w400,
                                           color: Colors.white,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               Positioned(
                                 top: 165,
                                 left: 10,
                                 right: 10,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       children: [
                                         Icon(
                                           Icons.watch_later_outlined,
                                           color: Colors.white,
                                           size: 20,
                                         ),
                                         SizedBox(width: 4,),
                                         Text("20 Min",
                                           style: TextStyle(
                                             fontSize: 12,
                                             fontWeight: FontWeight.w400,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ],
                                     ),
                                     Text("৳৪৫০",
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14,
                                           color: Colors.white
                                       ),
                                     )
                                   ],
                                 ),
                               ),

                             ],
                           ),
                         );
                       }
                   );
                 }else{
                   return Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Center(child: Text("No Resturent Fount"),),
                       Center(child: TextButton(
                         onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectNewAddress())),
                         child: Text("Try anotother location"),
                       ),)
                     ],
                   );
                 }
               },
             )
           );
  }

  Container buildHomeCategory(double width) {
    return Container(
                 width: width,
                 height: 250,
                 child: GridView.count(
                   padding: EdgeInsets.only(top: 20),
                   mainAxisSpacing: 20,
                   primary: false,
                   crossAxisCount: 3,
                   children: <Widget>[
                     Container(
                       margin: EdgeInsets.only(left: 10, right: 10),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: appColors.white,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 5,
                             blurRadius: 7,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Image.asset("assets/category/c1.jpeg",
                             height: 40,
                             width: 40,
                             fit: BoxFit.cover,
                           ),
                           Center(child: Text("Chicken Fry",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               fontSize: 10
                             ),
                           ))
                         ],
                       ),
                     ),

                     Container(
                       margin: EdgeInsets.only(left: 10, right: 10),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: appColors.white,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 5,
                             blurRadius: 7,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Image.asset("assets/category/c2.jpeg",
                             height: 50,
                             width: 50,
                             fit: BoxFit.cover,
                           ),
                           Center(child: Text("Chicken Fry",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                                 fontSize: 10.sp
                             ),
                           ))
                         ],
                       ),
                     ),

                     Container(
                       margin: EdgeInsets.only(left: 10, right: 10),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: appColors.white,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 5,
                             blurRadius: 7,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Image.asset("assets/category/c1.jpeg",
                             height: 40,
                             width: 40,
                             fit: BoxFit.cover,
                           ),
                           Center(child: Text("Chicken Fry",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                                 fontSize: 10
                             ),
                           ))
                         ],
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(left: 10, right: 10),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: appColors.white,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 5,
                             blurRadius: 7,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Image.asset("assets/category/c1.jpeg",
                             height: 40,
                             width: 40,
                             fit: BoxFit.cover,
                           ),
                           Center(child: Text("Chicken Fry",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                                 fontSize: 10
                             ),
                           ))
                         ],
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(left: 10, right: 10),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: appColors.white,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 5,
                             blurRadius: 7,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Image.asset("assets/category/c1.jpeg",
                             height: 40,
                             width: 40,
                             fit: BoxFit.cover,
                           ),
                           Center(child: Text("Chicken Fry",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                                 fontSize: 10
                             ),
                           ))
                         ],
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(left: 10, right: 10),
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: appColors.white,
                         borderRadius: BorderRadius.circular(10),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 5,
                             blurRadius: 7,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                          Icon(Icons.arrow_forward),
                           Center(child: Text("More Category",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                                 fontSize: 10
                             ),
                           ))
                         ],
                       ),
                     ),


                   ],
                 ),
               );
  }

  Column buildHomeSlider(double width, BuildContext context) {
    return Column(
                 children: [
                   Container(
                     child: CarouselSlider.builder(
                       itemCount: sliderList.length,
                       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                           Container(
                             child: Stack(
                               children: [
                                 Container(
                                   width: width,
                                   height: 130,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       image: DecorationImage(
                                         image: AssetImage(sliderList[itemIndex],),
                                         fit: BoxFit.cover,
                                       )
                                   ),

                                 )
                               ],
                             ),
                           ),
                       options: CarouselOptions(
                         aspectRatio: 16/6,
                         viewportFraction: 0.8,
                         initialPage: 0,
                         enableInfiniteScroll: true,
                         reverse: false,
                         autoPlay: true,
                         autoPlayInterval: Duration(seconds: 3),
                         autoPlayAnimationDuration: Duration(milliseconds: 800),
                         autoPlayCurve: Curves.fastOutSlowIn,
                         enlargeCenterPage: true,
                         scrollDirection: Axis.horizontal,
                         onPageChanged: (index, reason) {
                           setState(() {
                             _current = index;
                           });
                         },
                       ),
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: sliderList.asMap().entries.map((entry) {
                       return GestureDetector(
                         onTap: () => _controller.animateToPage(entry.key),
                         child: Container(
                           width: 12.0,
                           height: 12.0,
                           margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: (Theme.of(context).brightness == Brightness.dark
                                   ? Colors.white
                                   : appColors.mainColor)
                                   .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                         ),
                       );
                     }).toList(),
                   ),
                 ],
               );
  }

  Container buildIsLogin(double width) {
    return Container(
                 height: 130,
                 width: double.infinity,
                 decoration: BoxDecoration(),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 15,
                     ),
                    Text("Hey, There",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13.sp,
                      ),
                    ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                           width: width*.60,
                           child: Text(
                             "Log in or create an account for a faster ordering experience",
                             style: TextStyle(
                               fontSize: 10.sp,
                               fontWeight: FontWeight.w400,
                             ),
                           )
                         ),
                         Image.asset(
                           'assets/logo.png',
                           width: 50,
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 8,
                     ),
                    Container(
                      width: 100,
                      child: Bounce(
                          child: AppButton(text: "Login"),
                          duration: Duration(milliseconds: 80),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPages()));
                          }
                      ),
                    )
                   ],
                 ),
               );
  }

  Container buildMostPopular(double width) {
    return Container(
                 width: width,
                 height: 250,
                 child: ListView.builder(
                   padding: EdgeInsets.only(top: 20, bottom: 20),
                     scrollDirection: Axis.horizontal,
                     itemCount: 5,
                     itemBuilder: (context, index){
                       return Bounce(
                         duration: Duration(milliseconds: 80),
                         onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleFoods())),
                         child: Container(
                           width: 170,
                           height: 300,

                           margin: EdgeInsets.only(left: 10, right: 10),
                           decoration: BoxDecoration(
                            // color: appColors.white,
                             borderRadius: BorderRadius.circular(10),
                             // boxShadow: [
                             //   BoxShadow(
                             //     color: Colors.grey.withOpacity(0.5),
                             //     spreadRadius: 5,
                             //     blurRadius: 7,
                             //     offset: Offset(0, 3), // changes position of shadow
                             //   ),
                             // ],
                           ),
                           child: Stack(
                             children: [
                               ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.asset("assets/images/f1.jpeg",
                                   height: 200,
                                   width: 170,
                                   fit: BoxFit.cover,
                                 ),
                               ),
                               Container(
                                 height: 200,
                                 width: 170,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: appColors.blactText.withOpacity(0.5),
                                 ),
                               ),
                               Positioned(
                                 right: 10, top: 10,
                                 child: Container(
                                   padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                   decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                     color: appColors.mainColor,
                                   ),
                                   child: Center(child: Text("4.5*", style: TextStyle(color: Colors.white),)),
                                 ),
                               ),
                               Positioned(
                                 top: 130,
                                 left: 10,
                                 child: Text("Food Name",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                 ),
                               ),
                               Positioned(
                                 top: 150,
                                 left: 10,
                                 child: Text("Foods Category",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                  ),
                                 ),
                               ),
                               Positioned(
                                 top: 165,
                                 left: 10,
                                 right: 10,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       children: [
                                         Icon(
                                           Icons.watch_later_outlined,
                                           color: Colors.white,
                                         ),
                                         SizedBox(width: 4,),
                                         Text("20 Min",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                         ),
                                       ],
                                     ),
                                     Text("৳৪৫০",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                        color: Colors.white
                                      ),
                                     )
                                   ],
                                 ),
                               ),

                             ],
                           ),
                         ),
                       );
                     }
                 ),
               );
  }

  getAddressFromLatLng(context, double lat, double lng, int index) async {

    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$_host?key=${AppConfig.googleMapAPIKey}&language=en&latlng=$lat,$lng';
    if(lat != null && lng != null){
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        String _formattedAddress = data["results"][index]["formatted_address"];
        print(data["results"][index]["formatted_address"]);
        setState(() {
          isLocation = true;
          resLocation.addAll(data["results"][index]["formatted_address"]);
        });
        print("response ==== $resLocation");
        return _formattedAddress;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
