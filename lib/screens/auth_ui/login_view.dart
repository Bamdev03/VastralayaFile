import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vastralaya/controllers/auth/auth_controller.dart';
import 'package:vastralaya/routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    var email = TextEditingController();
    var password = TextEditingController();

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
                    "Welcome Back!",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  const Gap(8),
                  const Text(
                    "Sign in to continue shopping",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  const Gap(30),

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

                  Gap(25),

                  //login button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () async {
                        Loader.show(context);
                        await authController.login(email.text, password.text);
                        Loader.hide();
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Login", style: TextStyle(fontSize: 15)),
                    ),
                  ),

                  Gap(30),

                  // register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRoutes.register);
                        },
                        child: const Text(
                          "Register",
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
