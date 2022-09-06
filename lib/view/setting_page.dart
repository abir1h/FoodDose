import 'package:food_dose/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/ktext.dart';

class SettingPage extends StatefulWidget {

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool one = false;
  bool two = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        title: KText(text: 'Setting',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18,),
      ),
      body: ListView(
        children: [
       ListTile(
         onTap: ()=>languageDialog(context),
       title: KText(text: 'Language',color: Colors.black,fontWeight: FontWeight.bold,),
       subtitle: KText(text: 'English',color: Colors.grey.shade300,fontWeight: FontWeight.bold,fontSize: 12,),
       ),
       ListTile(
         onTap: ()=>choseTheme(context),
       title: KText(text: 'Theme',color: Colors.black,fontWeight: FontWeight.bold,),
       subtitle: KText(text: 'Light',color: Colors.grey.shade300,fontWeight: FontWeight.bold,fontSize: 12,),
       ),
       InkWell(
         onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPages())),
         child: ListTile(
         title: KText(text: 'Login',color: Colors.black,fontWeight: FontWeight.bold,),
         ),
       ),

        ],
      ),
    );
  }

  Future languageDialog(BuildContext context)=> showDialog(
    context: context, 
    builder: (context)=> Dialog(
      
      child: Column(
        mainAxisSize:MainAxisSize.min,
      children: [
        SizedBox(height: 15,),
        KText(text: 'Change Language',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22,),
        // CheckboxListTile(
        //   checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        //         activeColor:Colors.grey.shade300,
        //         checkColor: Colors.white,
        //         title: KText(text: 'English',fontWeight: FontWeight.bold,color: Colors.black,),
        //         value: one,
        //         controlAffinity: ListTileControlAffinity.leading,
        //         onChanged: (value) {
        //           setState(() {
        //             one = value!;
        //           });
        //         },
        //       ),
        // CheckboxListTile(
        //             checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        //
        //         activeColor:  Colors.grey.shade300,
        //         checkColor: Colors.white,
        //         title: KText(text: 'Bangla',fontWeight: FontWeight.bold,color: Colors.black,),
        //         value: two,
        //         controlAffinity: ListTileControlAffinity.leading,
        //         onChanged: (value) {
        //           setState(() {
        //             two = value!;
        //           });
        //         },
        //       ),

      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          TextButton(onPressed: (){
            Get.back();
          }, child: KText(text: 'CANCEL'))
        ],
      )
      
      ],
      ),
    )
    );
  Future choseTheme(BuildContext context)=> showDialog(
    context: context, 
    builder: (context)=> Dialog(
      
      child: Column(
        mainAxisSize:MainAxisSize.min,
      children: [
        SizedBox(height: 15,),
        KText(text: 'Chossen Theme',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22,),
        // CheckboxListTile(
        //   checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        //         activeColor:  Colors.grey.shade300,
        //   checkColor: Colors.white,
        //         title: KText(text: 'Dark',fontWeight: FontWeight.bold,color: Colors.black,),
        //         value: one,
        //         controlAffinity: ListTileControlAffinity.leading,
        //         onChanged: (value) {
        //           setState(() {
        //             one = value!;
        //           });
        //         },
        //       ),
        // CheckboxListTile(
        //             checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        //
        //         activeColor: Colors.grey.shade300,
        //         checkColor: Colors.white,
        //         title: KText(text: 'Light',fontWeight: FontWeight.bold,color: Colors.black,),
        //         value: two,
        //         controlAffinity: ListTileControlAffinity.leading,
        //         onChanged: (value) {
        //           setState(() {
        //             two = value!;
        //           });
        //         },
        //       ),

      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          TextButton(onPressed: (){
            Get.back();
          }, child: KText(text: 'CANCEL'))
        ],
      )
      
      ],
      ),
    )
    );
}