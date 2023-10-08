import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:aqua_explore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page_switcher.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: Column(
            children: [
              Image.asset("assets/images/main_logo_blue.png"),
              const SizedBox(height: 40),
              const Text(
                "Sign up",
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
              CustomPasswordTextField(),
              const SizedBox(height: 15),
              CustomPasswordTextField(label: "Confirm password"),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    activeColor: secondaryOrange,
                    value: rememberMe,
                    checkColor: secondaryOrange,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide.none),
                    hoverColor: Colors.transparent,
                    fillColor: MaterialStateProperty.all(const Color(0xFFF0F0F0)),
                    onChanged: (e) => e != null ? setState(() => rememberMe = !rememberMe) : null,
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(fontSize: 12.5),
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
                  text: "Sign up")
            ],
          ),
        ),
      ),
    );
  }
}
