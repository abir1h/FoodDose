import 'package:food_dose/Utility/colors..dart';
import 'package:food_dose/view/signle_foods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:sizer/sizer.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  //add fev
  late List Fav = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text("Popular Foods", style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (_, index){
            return Bounce(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleFoods()));

              },
              duration: Duration(milliseconds: 80),
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 2,
                          color: Colors.grey.shade200,
                          offset: Offset(0,2)
                      ),
                    ],
                  ),
                  child: Container(
                    width: width,
                    height: 75,

                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset("assets/images/f1.jpeg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20,),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width*.5,
                                  child: Text("Chicken Berger",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: appColors.blactText
                                    ),
                                  ),
                                ),

                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        Fav.add(index);
                                        print(Fav);
                                      });
                                    },
                                    child: Icon(
                                      Fav.isNotEmpty && Fav[0]==index ? Icons.favorite:Icons.favorite_border_outlined,
                                      color:  Fav.isNotEmpty && Fav[0]==index ?Colors.red: Colors.grey.shade400,
                                      size: 30, 
                                    )
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Thy Burger",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: appColors.blactText
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width: width/2.8,
                                  child: Text("\$230.90",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: appColors.mainColor
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
            );
            }
        )
      ),
    );
  }

}

