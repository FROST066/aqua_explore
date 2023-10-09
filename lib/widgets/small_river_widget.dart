import 'package:aqua_explore/pages/river_details.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallRiverWidget extends StatefulWidget {
  const SmallRiverWidget({super.key});

  @override
  State<SmallRiverWidget> createState() => _SmallRiverWidgetState();
}

class _SmallRiverWidgetState extends State<SmallRiverWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const RiverDetails()),
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        textStyle: const TextStyle(
          decoration: TextDecoration.none,
          height: 1.3,
          decorationStyle: TextDecorationStyle.double,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(9),
          width: MediaQuery.of(context).size.width * .85,
          constraints: const BoxConstraints(maxWidth: 500),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  "assets/images/river_profile.jpeg",
                  height: double.infinity,
                  // width: ,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Daleware river", style: TextStyle(color: primaryBlue)),
                      Text("12,4km")
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "More than 17 million people get their drinking water from the Delaware River basin, including two of the five largest cities in the U.S.",
                      style: TextStyle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Material(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text("4.3 pH"), Text("21C"), Text("10NTU")],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
