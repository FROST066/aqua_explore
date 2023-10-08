import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RiverDetails extends StatefulWidget {
  const RiverDetails({super.key});

  @override
  State<RiverDetails> createState() => _RiverDetailsState();
}

class _RiverDetailsState extends State<RiverDetails> {
  bool showAbout = false, showSpecies = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: const Icon(
                CupertinoIcons.back,
                color: primaryBlue,
              )),
        ),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
              child: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Image.asset(
                    "assets/images/river_profile.jpeg",
                    height: double.infinity,
                    fit: BoxFit.fill,
                  )),
              const Expanded(flex: 6, child: SizedBox())
            ],
          )),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * .6,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Lac Nokoue",
                          style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 20)),
                      SvgPicture.asset(
                        "assets/svg/learn.svg",
                        color: primaryBlue,
                        height: 30,
                        width: 30,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 16),
                    child: Row(
                      children: const [
                        Icon(Icons.location_on, color: primaryBlue),
                        SizedBox(width: 8),
                        Text("South Benin Republic")
                      ],
                    ),
                  ),
                  Material(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/learn.svg",
                              color: primaryBlue,
                              height: 18,
                              width: 18,
                            ),
                            const SizedBox(width: 8),
                            const Text("4.3")
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/learn.svg",
                                color: primaryBlue,
                                height: 18,
                                width: 18,
                              ),
                              const SizedBox(width: 8),
                              const Text("21 ºC")
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/learn.svg",
                              color: primaryBlue,
                              height: 18,
                              width: 18,
                            ),
                            const SizedBox(width: 8),
                            const Text("10 NTU")
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Species",
                        style: TextStyle(fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                      ),
                      AnimatedRotation(
                          turns: showAbout ? 0 : -0.5,
                          duration: const Duration(milliseconds: 500),
                          child: const Icon(Icons.keyboard_arrow_down))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: secondaryOrange,
                    width: 45,
                    height: 2.5,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: assetList.length,
                      itemBuilder: (context, index) => Container(
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(assetList[index]),
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "About",
                        style: TextStyle(fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                      ),
                      AnimatedRotation(
                          turns: showAbout ? 0 : -0.5,
                          duration: const Duration(milliseconds: 500),
                          child: const Icon(Icons.keyboard_arrow_down))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

final assetList = [];
