import 'dart:async';

import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:flutter/material.dart';

class OnQuestionningPage extends StatefulWidget {
  const OnQuestionningPage({super.key, required this.controller});
  final PageController controller;
  @override
  State<OnQuestionningPage> createState() => _OnQuestionningPageState();
}

class _OnQuestionningPageState extends State<OnQuestionningPage> {
  int timerValue = 30;
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (e) {
      print("$timerValue  &&  ${e.isActive}");
      timerValue > 0 ? setState(() => timerValue--) : timer?.cancel();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () => widget.controller
                .animateToPage(0, duration: const Duration(milliseconds: 600), curve: Curves.decelerate),
            child: const Icon(Icons.close, size: 25)),
        title: const Text(
          "Question 1/5",
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
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text(
                  "How many kilometers does the Atlantic sea cover on the south coast of Benin Republic ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryBlue, fontSize: 13),
                )),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Answers",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    )),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
                Expanded(
                  child: AppButtonWithoutBackground(
                    text: "1-  23Km",
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: AppButtonWithoutBackground(
                    text: "2-  55Km",
                    foregroundColor: Colors.white,
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
                Expanded(
                  child: AppButtonWithoutBackground(
                    text: "3-  23Km",
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: AppButtonWithoutBackground(
                    text: "4-  55Km",
                    foregroundColor: Colors.white,
                  ),
                ),
              ]),
              const SizedBox(height: 22),
              AppButtonWithoutBackground(
                text: "Continue",
                foregroundColor: Colors.white,
                onPressed: () => widget.controller
                    .animateToPage(2, duration: const Duration(milliseconds: 600), curve: Curves.decelerate),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30),
                  Container(
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 2.5)),
                    ),
                    child: Center(
                      child: Text(
                        "$timerValue",
                        style: const TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                  ),
                  const Icon(Icons.refresh, size: 30, color: Colors.white)
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
