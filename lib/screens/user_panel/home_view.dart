import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vastralaya/utils/app_constant.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appSecondaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [Text("home page")]),
        ),
      ),
    );
  }
}
