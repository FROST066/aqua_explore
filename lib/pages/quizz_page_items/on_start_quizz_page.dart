import 'package:aqua_explore/pages/quizz_page_items/on_questionning_page.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnStartQuizzPage extends StatefulWidget {
  const OnStartQuizzPage({super.key, required this.controller});
  final PageController controller;
  @override
  State<OnStartQuizzPage> createState() => _OnStartQuizzPageState();
}

class _OnStartQuizzPageState extends State<OnStartQuizzPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Quizz 1",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 15),
            child: Text(
              "00",
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                height: 150,
                child: const Center(
                    child: Text(
                  "Zambeze",
                  style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              AppButtonWithoutBackground(
                text: "Start",
                onPressed: () => widget.controller
                    .animateToPage(1, duration: const Duration(milliseconds: 600), curve: Curves.decelerate),
                foregroundColor: Colors.white,
              ),
              const Expanded(child: SizedBox()),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "• Use a home water filtration system instead of bottled water.",
                      style: TextStyle(fontSize: 12.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8).copyWith(left: 0),
                      child: const Text(
                        "• Take reusable bags to the grocery store",
                        style: TextStyle(fontSize: 12.5),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "• Use stainless steel or glass in place of plastic Tupperware",
                        style: TextStyle(fontSize: 12.5),
                      ),
                    ),
                    const Text(
                      "• Avoid plastic food packaging when possible",
                      style: TextStyle(fontSize: 12.5),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
