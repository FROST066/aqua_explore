import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar(
      {super.key,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.onChanged,
      required this.selectedIndex});
  final Color foregroundColor;
  final Color backgroundColor;
  final int selectedIndex;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => onChanged(0),
              child: CustomBottomBarItem(
                actived: selectedIndex == 0,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                text: "Home",
                asset: "assets/svg/home.svg",
              ),
            ),
            GestureDetector(
              onTap: () => onChanged(1),
              child: CustomBottomBarItem(
                actived: selectedIndex == 1,
                text: "Learn",
                asset: "assets/svg/learn.svg",
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
              ),
            ),
            GestureDetector(
              onTap: () => onChanged(2),
              child: CustomBottomBarItem(
                actived: selectedIndex == 2,
                text: "Chase",
                asset: "assets/svg/chase.svg",
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
              ),
            ),
            GestureDetector(
              onTap: () => onChanged(3),
              child: CustomBottomBarItem(
                actived: selectedIndex == 3,
                text: "Profil",
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
              ),
            ),
          ],
        ));
  }
}

class CustomBottomBarItem extends StatelessWidget {
  CustomBottomBarItem(
      {super.key,
      this.foregroundColor = Colors.white,
      this.backgroundColor = primaryBlue,
      required this.actived,
      required this.text,
      this.child,
      this.asset});
  final String text;
  final String? asset;
  final Widget? child;
  final bool actived;
  Color foregroundColor = Colors.white;
  Color backgroundColor = primaryBlue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: actived ? foregroundColor : Colors.transparent),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(children: [
        asset != null
            ? SvgPicture.asset(
                asset!,
                color: actived ? backgroundColor : foregroundColor,
                height: 20,
                width: 20,
              )
            : Image.asset(
                "assets/images/profile_image.png",
                height: 30,
                width: 30,
              ),
        if (actived)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              text,
              style: TextStyle(color: backgroundColor),
            ),
          )
      ]),
    );
  }
}
