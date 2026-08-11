import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vastralaya/controllers/auth/auth_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Get.find<AuthController>().authCheck();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/Vastralaya.webp', fit: BoxFit.cover),
      ),
    );
  }
}