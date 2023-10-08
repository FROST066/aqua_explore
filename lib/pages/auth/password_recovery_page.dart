import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:aqua_explore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
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
                "Password recovery",
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
              const SizedBox(height: 30),
              AppButton(
                foregroundColor: Colors.white,
                backgroundColor: primaryBlue,
                onPressed: () {},
                text: "Confirm",
              )
            ],
          ),
        ),
      ),
    );
  }
}
