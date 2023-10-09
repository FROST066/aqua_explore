import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:aqua_explore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change password"),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * .9,
          child: ListView(
            children: const [
              SizedBox(height: 25),
              CustomPasswordTextField(
                labelColor: secondaryOrange,
                label: "Current password",
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: CustomPasswordTextField(
                  labelColor: secondaryOrange,
                  label: "New password",
                ),
              ),
              CustomPasswordTextField(
                labelColor: secondaryOrange,
                label: "Confirm new password",
              ),
              SizedBox(height: 40),
              AppButtonWithoutBackground(text: "Confirm")
            ],
          ),
        ),
      ),
    );
  }
}
