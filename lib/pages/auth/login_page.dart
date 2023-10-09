import 'package:aqua_explore/pages/page_switcher.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:aqua_explore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              children: [
                Image.asset("assets/images/main_logo_blue.png"),
                const SizedBox(height: 40),
                const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  color: primaryBlue,
                  width: 60,
                  height: 2.5,
                ),
                const SizedBox(height: 33),
                const CustomTextField(label: "E-mail"),
                const SizedBox(height: 15),
                const CustomPasswordTextField(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Forgot password ?",
                      style: TextStyle(fontSize: 12.5, color: primaryBlue),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                AppButton(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryBlue,
                    onPressed: () => Get.to(
                          () => const PageSwitcher(),
                          transition: Transition.zoom,
                        ),
                    text: "Sign in")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
