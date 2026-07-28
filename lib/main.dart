import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vastralaya/screens/auth_ui/login_view.dart';
import 'package:vastralaya/screens/auth_ui/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      ),
      home: LoginView(),
    );
  }
}

