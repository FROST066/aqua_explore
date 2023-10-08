import 'package:aqua_explore/pages/auth/login_page.dart';
import 'package:aqua_explore/pages/auth/register_page.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnStartPage extends StatefulWidget {
  const OnStartPage({super.key});
  @override
  State<OnStartPage> createState() => _OnStartPageState();
}

class _OnStartPageState extends State<OnStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset("assets/images/main_logo_white.png"),
                  const SizedBox(height: 13),
                  const Text(
                    "AQUA EXPLORE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
              Column(
                children: [
                  AppButton(
                    foregroundColor: Colors.white,
                    backgroundColor: secondaryOrange,
                    text: "Sign in",
                    onPressed: () => Get.to(
                      () => const LoginPage(),
                      transition: Transition.rightToLeft,
                    ),
                  ),
                  const SizedBox(height: 15),
                  AppButton(
                    text: "Sign up",
                    foregroundColor: primaryBlue,
                    backgroundColor: Colors.white,
                    onPressed: () => Get.to(
                      () => const RegisterPage(),
                      transition: Transition.rightToLeft,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
