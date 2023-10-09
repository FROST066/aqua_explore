import 'package:aqua_explore/pages/learn_page_items/on_lesson_selected.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  int? selectedSubject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(
            "assets/svg/learn.svg",
            color: primaryBlue,
            height: 30,
            width: 30,
          ),
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
        title: const Text("Learn"),
      ),
      body: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Subjects",
                        style: TextStyle(fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Score: 0",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.width * .41),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5, crossAxisCount: 3, childAspectRatio: 1),
                      children: subjectsList
                          .map((e) => GestureDetector(
                              onTap: () => setState(() => selectedSubject = subjectsList.indexOf(e)),
                              child: SubjectWidget(
                                isSelected: selectedSubject == subjectsList.indexOf(e),
                                asset: e["asset"] ?? "",
                                title: e["title"] ?? "",
                              )))
                          .toList(),
                    ),
                  ),
                  if (selectedSubject != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Lessons",
                          style: TextStyle(fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "15",
                          style: TextStyle(fontWeight: FontWeight.bold, color: primaryBlue),
                        )
                      ],
                    ),
                  const SizedBox(height: 12),
                  if (selectedSubject != null)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () => Get.to(
                                  () => const OnLessonSelectedPage(),
                                  transition: Transition.rightToLeft,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: const Border.fromBorderSide(
                                          BorderSide(width: 1.5, color: primaryBlue))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Lesson $index",
                                            style: const TextStyle(
                                                color: primaryBlue, fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 2),
                                          const Text(
                                            "Pollution",
                                            style: TextStyle(color: primaryBlue),
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
                ],
              ))),
    );
  }
}

class SubjectWidget extends StatelessWidget {
  const SubjectWidget({super.key, required this.isSelected, required this.asset, required this.title});
  final bool isSelected;
  final String asset, title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxHeight: 250, maxWidth: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !isSelected ? Colors.white : primaryBlue,
          border: const Border.fromBorderSide(BorderSide(width: 1.5, color: primaryBlue))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              asset,
              color: isSelected ? Colors.white : primaryBlue,
              height: 30,
              width: 30,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: isSelected ? Colors.white : primaryBlue),
            )
          ],
        ),
      ),
    );
  }
}

final subjectsList = [
  {"title": "Seas", "asset": "assets/svg/subjects/seas.svg"},
  {"title": "Rivers", "asset": "assets/svg/subjects/rivers.svg"},
  {"title": "Species", "asset": "assets/svg/subjects/species.svg"},
];
