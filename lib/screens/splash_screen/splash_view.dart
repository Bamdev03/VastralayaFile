import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vastralaya/controllers/auth/auth_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    authController.authCheck();
    return Scaffold(
      body: Center(
        child: Image.asset('images/Vastralaya.webp', fit: BoxFit.cover,),
      ),
    );
  }
}