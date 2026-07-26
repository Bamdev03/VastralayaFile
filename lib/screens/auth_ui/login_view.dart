import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vastralaya/screens/auth_ui/signin_screen.dart';
import 'package:vastralaya/widgets/social_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Gap(15),

                  // password field
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Gap(25),

                  //login button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Login"),
                    ),
                  ),

                  Gap(30),

                  // google button
                  SocialButton(
                    label: "Continue with Google",
                    icon: Icons.g_mobiledata,
                    onTap: () {},
                    iconColor: Colors.green,
                  ),

                  Gap(15),

                  //facebook button
                  SocialButton(
                    label: "Continue with facebook",
                    icon: Icons.facebook,
                    onTap: () {},
                    iconColor: Colors.blue,
                  ),
                  Gap(15),

                  // register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
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
