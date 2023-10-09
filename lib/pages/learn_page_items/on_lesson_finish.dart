import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnLessonFinishPage extends StatefulWidget {
  const OnLessonFinishPage({super.key});

  @override
  State<OnLessonFinishPage> createState() => _OnLessonFinishPageState();
}

class _OnLessonFinishPageState extends State<OnLessonFinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Lesson 1",
            style: TextStyle(fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.refresh, color: secondaryOrange),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .45,
                    child: ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                if (index == 0 || index == 1) Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.fromBorderSide(BorderSide(
                                        width: 1.5, color: primaryBlue.withOpacity(index == 1 ? 1 : .45)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Lesson $index",
                                          style: TextStyle(
                                              color: primaryBlue.withOpacity(index == 1 ? 1 : .45),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "Pollution",
                                          style:
                                              TextStyle(color: primaryBlue.withOpacity(index == 1 ? 1 : .45)),
                                        ),
                                      ],
                                    ),
                                    if (index == 0)
                                      const Icon(
                                        Icons.check_circle,
                                        color: secondaryOrange,
                                        size: 26,
                                      )
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(height: 13),
                        itemCount: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: AppButtonWithoutBackground(
                      text: "Start",
                      foregroundColor: primaryBlue,
                      onPressed: () => Get.to(
                        () => const OnLessonFinishPage(),
                        transition: Transition.rightToLeft,
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
