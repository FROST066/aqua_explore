import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:aqua_explore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change e-mail"),
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
                label: "Password",
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: CustomTextField(labelColor: secondaryOrange, label: "Current e-mail"),
              ),
              CustomTextField(labelColor: secondaryOrange, label: "New e-mail"),
              SizedBox(height: 40),
              AppButtonWithoutBackground(text: "Confirm")
            ],
          ),
        ),
      ),
    );
  }
}
