import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnFinishQuizzPage extends StatefulWidget {
  const OnFinishQuizzPage({super.key, required this.controller});
  final PageController controller;
  @override
  State<OnFinishQuizzPage> createState() => _OnFinishQuizzPageState();
}

class _OnFinishQuizzPageState extends State<OnFinishQuizzPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: const SizedBox(),
        title: const Text(
          "Quizz 1",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () => widget.controller.jumpToPage(0),
            child: const Padding(
                padding: EdgeInsets.only(top: 16, right: 15),
                child: Icon(
                  Icons.refresh,
                  color: secondaryOrange,
                )),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "Score",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  "90",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const Text(
                "3:44",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 40),
              AppButtonWithoutBackground(
                text: "Continue",
                onPressed: () => Get.back(),
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
