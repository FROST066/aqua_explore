import 'package:aqua_explore/pages/learn_page_items/on_lesson_finish.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnLessonStartPage extends StatelessWidget {
  const OnLessonStartPage({super.key});
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
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: Text(
                "00",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            )
          ],
        ),
        body: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: primaryBlue,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0,
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text("Pollution"), Text("02:30")],
                        ),
                      )),
                  const Text(
                      "More than 17 million people get their drinking water from the Delaware River basin, including two of the five largest cities in the U.S.—New York City and Philadelphia. Any yet, the river offers so much more than a drinking water supply to the 42 counties and five states it passes through on its way to the Atlantic Ocean. Steeped in history, dripping with scenic beauty, and essential to the existence of some of the most significant communities along the Eastern seaboard, the Delaware River undeniably contributes its share to the lifeblood of the nation."),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tips",
                        style: TextStyle(fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                        height: 30,
                        child: AppButton(
                            foregroundColor: Colors.white,
                            backgroundColor: secondaryOrange,
                            textFontSize: 13,
                            onPressed: () {},
                            text: "Contribute"),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: secondaryOrange,
                      width: 30,
                      height: 3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => TipWidget(
                              list: tipsListList[index],
                              title: tipsTileList[index],
                            ),
                        separatorBuilder: (context, index) => const SizedBox(height: 18),
                        itemCount: tipsListList.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: AppButtonWithoutBackground(
                      text: "Next",
                      foregroundColor: primaryBlue,
                      onPressed: () => Get.to(
                        () => const OnLessonFinishPage(),
                        transition: Transition.rightToLeft,
                      ),
                    ),
                  )
                ]))));
  }
}

class TipWidget extends StatefulWidget {
  const TipWidget({super.key, required this.title, required this.list});
  final String title;
  final List<String> list;

  @override
  State<TipWidget> createState() => _TipWidgetState();
}

class _TipWidgetState extends State<TipWidget> with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(height: 20, width: 2.5, color: primaryBlue),
                const SizedBox(width: 15),
                Text(
                  widget.title,
                  style: const TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: Icon(
                !isExpanded ? Icons.add : CupertinoIcons.minus,
                color: primaryBlue,
              ),
            )
          ],
        ),
        if (isExpanded)
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFFF6F6F6)),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.list
                  .map((e) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• "),
                          Expanded(child: Text(e, style: const TextStyle(fontSize: 12))),
                        ],
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }
}

final tipsTileList = [
  "Use less plastic",
  "Conserve water",
  "Prevent runoff",
  "Pick up pet waste",
  "Don’t drain certain products",
];

final tipsListList = [
  [
    "Use a home water filtration system instead of bottled water.",
    "Take reusable bags to the grocery store",
    "Use stainless steel or glass in place of plastic Tupperware ",
    "Avoid plastic food packaging when possible"
  ],
  [
    "Shut the water off when not in use",
    "Take care of limescale",
    "Run fuller loads of dishes",
    "Install a more efficient toilet",
    "Harvest rainwater for outdoor use",
    "Use a smart leak detection system"
  ],
  ["Collect rainwater in a rain barrel", "Implement a dry well of rain garden", "Cover topsoil with mulch"],
  [
    "Scooped pet waste",
    "Place them in a biodegradable bag or container",
    "Discard in the trash",
  ],
  [
    "Avoid flushing or draining any household cleaning chemicals, medications or products that contain greases or oil. These products should be placed in a sealed, leak-free container and discarded in the trash."
  ]
];
