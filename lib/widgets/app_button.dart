import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.onPressed,
      required this.text});

  final Color foregroundColor;
  final Color backgroundColor;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .85,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            maximumSize: const Size.fromWidth(500),
            fixedSize: const Size.fromHeight(45),
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15.8),
          ),
        ),
      ),
    );
  }
}
