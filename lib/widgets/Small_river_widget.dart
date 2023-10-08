import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';

class SmallRiverWidget extends StatefulWidget {
  const SmallRiverWidget({super.key});

  @override
  State<SmallRiverWidget> createState() => _SmallRiverWidgetState();
}

class _SmallRiverWidgetState extends State<SmallRiverWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .85,
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            "assets/images/river_profile.jpeg",
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Daleware river", style: TextStyle(color: primaryBlue)), Text("")],
            )
          ],
        )
      ]),
    );
  }
}
