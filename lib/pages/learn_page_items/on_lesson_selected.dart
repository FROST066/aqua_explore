import 'package:aqua_explore/pages/learn_page_items/on_lesson_start.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnLessonSelectedPage extends StatefulWidget {
  const OnLessonSelectedPage({super.key});

  @override
  State<OnLessonSelectedPage> createState() => _OnLessonSelectedPageState();
}

class _OnLessonSelectedPageState extends State<OnLessonSelectedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lessons",
          style: TextStyle(fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: primaryBlue),
              child: const Icon(Icons.search, color: Colors.white),
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
                const SizedBox(height: 30),
                Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryBlue,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/subjects/seas.svg",
                        color: Colors.white,
                        height: 35,
                        width: 35,
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 22),
                  child: Text(
                    "Seas",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: primaryBlue),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 35),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: const Border.fromBorderSide(BorderSide(width: 1.5, color: primaryBlue))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Lesson 1",
                            style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Pollution",
                            style: TextStyle(color: primaryBlue),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.check_circle,
                        color: secondaryOrange,
                        size: 26,
                      )
                    ],
                  ),
                ),
                AppButtonWithoutBackground(
                  text: "Start",
                  foregroundColor: primaryBlue,
                  onPressed: () => Get.to(
                    () => const OnLessonStartPage(),
                    transition: Transition.rightToLeft,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
