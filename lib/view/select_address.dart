import 'dart:async';
import 'dart:convert';
import 'package:food_dose/Utility/colors..dart';
import 'package:food_dose/app_config.dart';
import 'package:food_dose/view/home-screen.dart';
import 'package:food_dose/view/onboarding_page.dart';
import 'package:food_dose/widget/buttom-navigation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:geolocator/geolocator.dart';

class SelectNewAddress extends StatefulWidget {
  final double? lat;
  final double? lon;
  const SelectNewAddress({this.lat, this.lon});

  @override
  State<SelectNewAddress> createState() => _SelectNewAddressState();
}

class _SelectNewAddressState extends State<SelectNewAddress> {

  //search controller
  final _searchController = TextEditingController();

  get val => null;

  late double FinalLat;
  late double FinalLon;

  String? location;
  bool isLocation = false;
  //init state
  initState(){
    super.initState();
    futureSearch = getSuggtion(val);
    currentLocation();
  }

  late Future futureSearch; 
  //google map
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.7274758,90.4383239),
    zoom: 10.4746,
  );

  late double lan;
  late double lng;
  final List<Marker> _marker = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(23.7805733,90.2792371),
        // infoWindow:InfoWindow(
        //   title: "Capi"
        // )
    ),
  ];


  late List PlaseList = [];


  //Location permisions
  Future<Position> currentLocation()async{

    print("Working");
    
    await Geolocator.requestPermission().then((value) {
      print("Curent location is get");
      
    }).onError((error, stackTrace) {
      print("error $error");
    } );

    return await Geolocator.getCurrentPosition();
  }

  //sarch location



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: ()=>Navigator.pop(context),
        ),
        title: Text("Select Your Address", style: TextStyle(color: Colors.black, fontSize: 10.sp, fontWeight: FontWeight.w400),),

      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
          rotateGesturesEnabled: false,
            markers: Set<Marker>.of(_marker),
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            trafficEnabled:true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onTap:(value)async{
              isLocation = true;
              getAddressFromLatLng(context, value.latitude, value.longitude);



              _marker.add(
                  Marker(
                      markerId:MarkerId("2"),
                      position: LatLng(value.latitude, value.longitude),
                      infoWindow: InfoWindow(
                          title: "Current Location"
                      )
                  )
              );


              final CameraPosition _kLake = CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(value.latitude, value.longitude),
                  tilt: 59.440717697143555,
                  zoom: 19.151926040649414);

              //google map
              CameraPosition cameraPosition = CameraPosition(
                target: LatLng(value.latitude, value.longitude),
                zoom: 19.4746,
              );
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

              setState(() {});

            },


            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),



          // Container(
          //   margin: EdgeInsets.only(top: height*.07, left: 20, right: 20),
          //   child:
          //   TextFormField(
          //     controller: _searchController,
          //     onChanged: (val){
          //       setState(() {
          //         getSuggtion(val);
          //         if(val.isEmpty){
          //           PlaseList.clear();
          //         }
          //       });
          //     },
          //     decoration: InputDecoration(
          //         fillColor: Colors.white,
          //         filled: true,
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(100),
          //         ),
          //         contentPadding: EdgeInsets.only(left: 20 ,right: 20),
          //         prefixIcon: Icon(
          //             Icons.search
          //         ),
          //         suffixIcon: IconButton(
          //             onPressed: ()=> currentLocationPick(),
          //             icon: Icon(Icons.location_searching, color: appColors.mainColor,)),
          //         label: Text("Search your location")
          //
          //     ),
          //   ),
          //
          // ),
          // PlaseList.isNotEmpty? Container(
          //   margin: EdgeInsets.only(top: height*.13,),
          //   height: 500,
          //   width: width,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(30)
          //   ),
          //   child: ListView.builder(
          //       itemCount: PlaseList.length,
          //       itemBuilder: (context, index){
          //         print(PlaseList[index]);
          //         return InkWell(
          //           onTap: () async{
          //             print("c;lecakd");
          //             selectPlaces(double.parse(PlaseList[index]["geometry"]["location"]["lat"]), double.parse(PlaseList[index]["geometry"]["location"]["lon"]));
          //
          //             // FinalLat = double.parse(PlaseList[index]["geometry"]["location"]["lat"]);
          //             // FinalLon = double.parse(PlaseList[index]["geometry"]["location"]["lon"]);
          //             // selectPlaces( FinalLat,  FinalLon);
          //             // //PlaseList.clear();
          //             // setState(() {
          //             //
          //             // });
          //           },
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 border: Border(
          //                     bottom: BorderSide(width: 1, color: Colors.grey.shade200)
          //                 )
          //             ),
          //             child: ListTile(
          //               leading: Icon(Icons.location_on_outlined, color: appColors.mainColor, size: 30.sp,),
          //               title: Text("${PlaseList[index]["address_components"][0]["long_name"].toString()}"),
          //               subtitle: Text("${PlaseList[index]["formatted_address"].toString()}"),
          //             ),
          //           ),
          //         );
          //       }
          //   ),
          // ):Center(),
        ],
      ),


      bottomNavigationBar: isLocation ? Container(
        width: width,
        height: 140,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child:
                RichText(text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Address: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                            color: appColors.mainColor
                        )
                    ),
                    TextSpan(
                        text: "$location",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                            color: Colors.black
                        )
                    )
                  ],
                ))

            ),

            InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigation(index: 0,)));
              },
              child: Container(
                  margin: EdgeInsets.only(left: width/4, right: width/4, bottom: 30),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: appColors.mainColor,
                  ),
                  child: Center(
                    child:  Text("Use My Location", style: TextStyle(color: Colors.white),),
                  )
              ),
            )
          ],
        ),
      ):Container(height: 0,),



      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async{
      //     print("cleck");
      //     currentLocationPick();
      //   },
      //   backgroundColor: Colors.white,
      //   child: Icon(
      //     Icons.location_searching,
      //     color: appColors.mainColor,
      //   ),
      // ),
    );
  }

  void currentLocationPick() async{
    currentLocation().then((value) async{
      print("Curent location is get");

      // SharedPreferences localDatabase = await SharedPreferences.getInstance();
      //
      //
      // localDatabase.setString('lat', value.latitude.toString());
      // localDatabase.setString('lon',  value.longitude.toString());

      // print(localDatabase.getString("lon"));

      // getAddressFromLatLng(context, value.latitude, value.longitude);

      print(value.latitude.toString() +" "+value.longitude.toString());

      _marker.add(
          Marker(
              markerId:MarkerId("2"),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: InfoWindow(
                  title: "Current Location"
              )
          )
      );

      // final CameraPosition _kLake = CameraPosition(
      //     bearing: 192.8334901395799,
      //     target: LatLng(value.latitude, value.longitude),
      //     tilt: 59.440717697143555,
      //     zoom: 19.151926040649414);
      //
      // //google map
      // CameraPosition cameraPosition = CameraPosition(
      //   target: LatLng(value.latitude, value.longitude),
      //   zoom: 19.4746,
      // );
      // final GoogleMapController controller = await _controller.future;
      // controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
      //
      // setState(() {});

    });
  }

  Future getSuggtion(val) async{
    print(val);
    var apiKey = AppConfig.googleMapAPIKey;
    var request = "${AppConfig.googleMapBaseUrl}/geocode/json?address=$val&key=$apiKey&channel=100";

    var response = await http.get(Uri.parse(request));

    //print(response.body);
   // print(response.statusCode);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body)["results"];
      PlaseList.addAll(body);
      //print(body);


      return PlaseList;
    }
    return PlaseList;
  }

  getAddressFromLatLng(context, double lat, double lng) async {
    print(lat,);
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$_host?key=${AppConfig.googleMapAPIKey}&language=en&latlng=$lat,$lng';
    if(lat != null && lng != null){
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String _formattedAddress = data["results"][0]["formatted_address"];
        setState(() {
          isLocation = true;
          location = _formattedAddress;
        });
        SharedPreferences localStore = await SharedPreferences.getInstance();
        localStore.setString("lat", "$lat");
        localStore.setString("lng", "$lng");
        localStore.setString("full_address", "$_formattedAddress");
        print("response ==== $location");
        return _formattedAddress;
      } else return null;
    } else return null;
  }


}
//
// bottomNavigationBar:  Container(
// width: MediaQuery.of(context).size.width/1.2,
// height: 100,
// padding: EdgeInsets.only(bottom: 20, top: 20),
// color: Colors.white,
// child: Column(
// children:[
// Bounce(
// duration: Duration(milliseconds: 80),
// onPressed: (){
// print("object");
// Navigator.push(context, MaterialPageRoute(builder: (context)=>AppBottomNavigation(index: 0,)));
// },
// child: Container(
// padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: appColors.mainColor,
// ) ,
// child: Text("Current Location", style: TextStyle(color: Colors.white),),
// ),
// ),
// ],
// ),
// ),

