import 'package:aqua_explore/pages/on_start_page.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const OnStartPage(),
    );
  }
}
