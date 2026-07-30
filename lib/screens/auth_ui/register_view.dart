import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vastralaya/controllers/auth/auth_controller.dart';
import 'package:vastralaya/routes/app_routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>(); 
    var name = TextEditingController();
    var email = TextEditingController();
    var password = TextEditingController();
    var phone = TextEditingController();
    var address = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  const Gap(30),

                  // name field
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      label: Text("Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Gap(15),

                  // email field
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      label: Text("Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Gap(15),

                  // password field
                  Obx(() {
                    return TextFormField(
                       obscureText: authController.isVisible.value,
                      controller: password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        label: Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            authController.toggleEye();
                          },
                          icon: Icon(
                           authController.isVisible.value ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                    );
                  }),

                  Gap(15),

                  // phone field
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      label: Text("Phone"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Gap(15),

                  // Address field
                  TextFormField(
                    controller: address,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      label: Text("City"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Gap(25),

                  // register button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () async{
                        Loader.show(context);
                        await authController.register(name.text, email.text, password.text, phone.text, address.text);
                        Loader.hide();
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Register", style: TextStyle(fontSize: 15)),
                    ),
                  ),

                  Gap(30),

                  // login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRoutes.login);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
