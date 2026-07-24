import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vastralaya/utils/app_constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
        title: Text("Welcome to Vastralaya",
        style: TextStyle(color: AppConstant.appTextColor),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset("assets/logo.jpeg"),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text("Happy Shopping",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,),)),
              SizedBox(height:Get.height/12,
              ),
              Material(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  width: Get.width/1.2,
                  height: Get.height/12,
                  child:TextButton.icon(
                    icon:Image.asset("assets/googleicon.jpg",
                    width: Get.width/12,
                    height: Get.height/12,) ,
                    onPressed: () {}, label: Text("Sign in with google",style:TextStyle(fontSize: 22,color: AppConstant.appTextColor),)),
                ),
              ),
             SizedBox(height:Get.height/50,
              ),
              Material(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  width: Get.width/1.2,
                  height: Get.height/12,
                  child:TextButton.icon(
                    icon:Image.asset("assets/emailicon.jpg",
                    width: Get.width/12,
                    height: Get.height/12,) ,
                    onPressed: () {}, label: Text("Sign in with Email",style:TextStyle(fontSize: 22,color: AppConstant.appTextColor),)),
                ),
              )

          ],
        ),
      ),
    );
  }
}