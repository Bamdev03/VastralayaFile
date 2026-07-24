import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vastralaya/utils/app_constant.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
Widget build(BuildContext context) {
  final isKeyboardVisible =
      MediaQuery.of(context).viewInsets.bottom > 0;

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: AppConstant.appSecondaryColor,
      title: const Text("Welcome Back To Vastralaya",style: TextStyle(color: AppConstant.appTextColor),),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (!isKeyboardVisible)
              Image.asset("assets/logo3.jpeg",
              height: 100,
              fit: BoxFit.contain,
              
              ),
              SizedBox(height: Get.height/100,),
              Text("Vastralaya",style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              ),
              Text("Your Style, Your Way",
              style: TextStyle(
              color: AppConstant.appSecondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 25,),
              Container(
                margin: EdgeInsets.only(left: 0,right: 0),
                child: SizedBox(
                  height:300,
                  child: Image.asset("assets/shop.jpeg",
                  fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: AppConstant.appTextColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35),),
                ),
                child: Column(children: [
                  const Text("Welcome Back!",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 8,),
                  const Text("Sign in to continue shopping your favourits styles.",textAlign:TextAlign.center,
                  style: TextStyle(fontSize:16, color: AppConstant.appSecondaryColor,
                  ),),
                ],
                ),
              ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText:"Email",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.only(top: 2.0,left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10.0),
                    )
                    ),
                ),
              )
              ),
               SizedBox(height: Get.height/40,),
              Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText:"Password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility_off),
                    contentPadding: EdgeInsets.only(top: 2.0,left: 8.0),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10.0),
                    )
                    ),
                ),
              )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerRight,
                child: Text("Forget Password?",style: TextStyle(
                  color: AppConstant.appSecondaryColor,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height:Get.height/50,
                  ),
               Material(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppConstant.appSecondaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: Get.width/1.6,
                      height: Get.height/18,
                      child: TextButton(
                        onPressed: () {},
                         child: Text("SIGN IN",style: TextStyle(color: AppConstant.appTextColor,fontWeight: FontWeight.bold),
                         ),
                         ),
                     
                    ),
                  
                  ),
                  SizedBox(height:Get.height/50,
                  ),
                  Row(
                    children: const[
                      Expanded(child: Divider()),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("or continue with",
                      style: TextStyle(color: AppConstant.appMainColor,fontSize: 16,),),),
                      Expanded(child: Divider()),
                    ],
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   Text("Don't have an account?",style: TextStyle(color: AppConstant.appSecondaryColor,fontWeight: FontWeight.bold),
                   ),
                  
                    Text("SIGN UP",style: TextStyle(color: AppConstant.appSecondaryColor,fontSize:18,fontWeight: FontWeight.bold),
                    ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      socialButton(Icons.g_mobiledata),
                      socialButton(Icons.facebook),
                      socialButton(Icons.apple),

                  ],),
            const SizedBox(height: 25,),
          ],
        ),
      ),
    ),
  );
}
  }
  Widget socialButton(IconData icon) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(color: AppConstant.appSecondaryColor),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }


