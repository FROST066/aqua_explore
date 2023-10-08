import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, this.controller});
  final String label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "$label :",
            style: const TextStyle(
              fontSize: 15,
              color: primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 13.5),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF0F0F0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              )),
        )
      ],
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField({super.key, this.label, this.controller});
  String? label;
  final TextEditingController? controller;

  @override
  State<CustomPasswordTextField> createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "${widget.label ?? "Password"} :",
            style: const TextStyle(
              fontSize: 15,
              color: primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          style: const TextStyle(fontSize: 13.5),
          controller: widget.controller,
          obscureText: show,
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () => setState(() => show = !show),
                  child: Icon(show ? Icons.visibility : Icons.visibility_off)),
              filled: true,
              fillColor: const Color(0xFFF0F0F0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              )),
        )
      ],
    );
  }
}
