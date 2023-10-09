import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.onPressed,
      this.textFontSize,
      required this.text});
  final double? textFontSize;
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
            style: TextStyle(fontSize: textFontSize ?? 15.8),
          ),
        ),
      ),
    );
  }
}

class AppButtonWithoutBackground extends StatelessWidget {
  const AppButtonWithoutBackground({super.key, required this.text, this.foregroundColor, this.onPressed});
  final String text;
  final Color? foregroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * .85,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          maximumSize: const Size.fromWidth(500),
          fixedSize: const Size.fromHeight(45),
          elevation: 0,
          // visualDensity: VisualDensity.compact,
          backgroundColor: Colors.transparent,
          foregroundColor: foregroundColor ?? primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: foregroundColor ?? primaryBlue, width: 1.5),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 15.8, color: foregroundColor ?? primaryBlue),
          ),
        ),
      ),
    );
  }
}
