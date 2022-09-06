import 'dart:convert';
import 'package:food_dose/view/select_address.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:food_dose/Utility/colors..dart';

import 'app_config.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {

  //search controller
  final _searchController = TextEditingController();

  get val => null;

  var FinalLat;
  var FinalLon;

  //init state
  initState(){
    super.initState();
    futureSearch = getSuggtion(val);
    print("final $FinalLat");
    print(FinalLon);
  }
  late List PlaseList = [];
  late Future futureSearch;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.mainColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black54,),
          onPressed: ()=>Navigator.pop(context),
        ),
        title:  Text("Find you location")
      ),
      body:  Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child:
            TextFormField(
              controller: _searchController,
              onChanged: (val){
                setState(() {
                  getSuggtion(val);
                  if(val.isEmpty){
                    PlaseList.clear();
                  }
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(100),
                // ),
                label: Text("Search Your Location"),
                contentPadding: EdgeInsets.only(left: 20 ,right: 20),
                prefixIcon: Icon(
                    Icons.search
                ),

              ),
            ),

          ),
          PlaseList.isNotEmpty? Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: ListView.builder(
                  itemCount: PlaseList.length,
                  itemBuilder: (context, index){
                    var lat = PlaseList[index]["geometry"]["location"]["lat"];
                    var lon = PlaseList[index]["geometry"]["location"]["lon"];

                    // print(PlaseList[index]);
                    return InkWell(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectNewAddress(lat: lat, lon: lon,)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                            border: Border(
                                bottom: BorderSide(width: 1, color: Colors.grey.shade200)
                            )
                        ),
                        child: ListTile(
                          leading: Icon(Icons.location_on_outlined, color: appColors.mainColor, size: 30.sp,),
                          title: Text("${PlaseList[index]["address_components"][0]["long_name"].toString()}"),
                          subtitle: Text("${PlaseList[index]["formatted_address"].toString()}"),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ):Center(),
        ],
      )
    );
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
}
