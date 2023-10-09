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
  bool showAbout = true, showSpecies = true;
  final pageViewController = PageController(initialPage: 0, keepPage: true);
  String selectedSpeci = assetList.first;
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
            child: const Icon(CupertinoIcons.back, color: primaryBlue),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
              child: Column(
            children: [
              Expanded(
                  flex: 4,
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
              height: MediaQuery.of(context).size.height * .7,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .74,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Lac Nokoue",
                              style:
                                  TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 20)),
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
                        elevation: 0,
                        color: Colors.transparent,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        child: Row(
                          children: [
                            const SizedBox(width: 5),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/ph.svg",
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
                                    "assets/svg/temp.svg",
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
                                  "assets/svg/ntu.svg",
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
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: pageViewController,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "About",
                                    style: TextStyle(
                                        fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() => showAbout = !showAbout),
                                    child: AnimatedRotation(
                                      turns: !showAbout ? 0 : -0.5,
                                      duration: const Duration(milliseconds: 300),
                                      child: const Icon(Icons.keyboard_arrow_down),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                color: secondaryOrange,
                                width: 45,
                                height: 2.5,
                              ),
                              if (showAbout)
                                const Text(
                                    "More than 17 million people get their drinking water from the Delaware River basin, including two of the five largest cities in the U.S.—New York City and Philadelphia. Any yet, the river offers so much more than a drinking water supply to the 42 counties and five states it passes through on its way to the Atlantic Ocean. Steeped in history, dripping with scenic beauty, and essential to the existence of some of the most significant communities along the Eastern seaboard, the Delaware River undeniably contributes its share to the lifeblood of the nation."),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Species",
                                    style: TextStyle(
                                        fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() => showSpecies = !showSpecies),
                                    child: AnimatedRotation(
                                        turns: !showSpecies ? 0 : -0.5,
                                        duration: const Duration(milliseconds: 300),
                                        child: const Icon(Icons.keyboard_arrow_down)),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8).copyWith(bottom: 15),
                                color: secondaryOrange,
                                width: 45,
                                height: 2.5,
                              ),
                              if (showSpecies)
                                SizedBox(
                                  height: 90,
                                  child: ListView.builder(
                                    itemCount: assetList.length,
                                    itemBuilder: (context, index) => GestureDetector(
                                      onTap: () {
                                        setState(() => selectedSpeci = assetList[index]);
                                        pageViewController.animateToPage(1,
                                            duration: const Duration(milliseconds: 900),
                                            curve: Curves.decelerate);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        width: 90,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                                        child: Image.asset(
                                          assetList[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                            ]),
                            // Species details

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () => pageViewController.animateToPage(0,
                                            duration: const Duration(milliseconds: 900),
                                            curve: Curves.decelerate),
                                        child: const Icon(CupertinoIcons.back, color: primaryBlue)),
                                    const SizedBox(width: 8),
                                    const Text(
                                      "Corails",
                                      style: TextStyle(
                                          fontSize: 21, color: secondaryOrange, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                      "Vous devez certainement avoir un bijou en corail qui traîne quelque part chez vous. Un pendentif offert par votre mère ou un collier déniché lors d’une vente privée, et que vous portez de temps à autres pour apporter cette touche de couleur, et ce cachet méditerranéen à vos tenues. Effectivement, le corail rouge est très demandé aussi bien en joaillerie, mais aussi dans la confection de robes de soirée ou la sculpture."),
                                ),
                                Container(
                                  height: 170,
                                  width: double.infinity,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                                  child: Image.asset(
                                    selectedSpeci,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final assetList = [
  "assets/images/species/speci1.jpeg",
  "assets/images/species/speci2.jpeg",
  "assets/images/species/speci3.jpeg",
  "assets/images/species/speci4.jpeg"
];
