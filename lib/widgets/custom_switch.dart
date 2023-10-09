import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool state = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => state = !state),
      child: Container(
        height: 22,
        width: 40,
        padding: const EdgeInsets.all(4),
        decoration:
            const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.black),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 150),
          alignment: state ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
