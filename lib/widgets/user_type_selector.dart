import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class UserTypeSelector extends StatefulWidget {
  const UserTypeSelector({super.key});

  @override
  State<UserTypeSelector> createState() => _UserTypeSelectorState();
}

class _UserTypeSelectorState extends State<UserTypeSelector> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        radius: 30,
        bodyBuilder: (context) => const UserTypeSelectorItem(),
        direction: PopoverDirection.bottom,
        height: 130,
        width: 160,
        arrowHeight: 0,
        arrowWidth: 0,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 110,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.person_outline_outlined, color: primaryBlue),
            Text(
              "User",
              style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              color: primaryBlue,
            )
          ],
        ),
      ),
    );
  }
}

class UserTypeSelectorItem extends StatefulWidget {
  const UserTypeSelectorItem({super.key});

  @override
  State<UserTypeSelectorItem> createState() => _UserTypeSelectorItemState();
}

class _UserTypeSelectorItemState extends State<UserTypeSelectorItem> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => setState(() => selectedIndex = 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person_outline_outlined,
                      color: selectedIndex != 0 ? primaryBlue : secondaryOrange),
                  Text(
                    "User",
                    style: TextStyle(
                        color: selectedIndex != 0 ? primaryBlue : secondaryOrange,
                        fontWeight: FontWeight.bold),
                  ),
                  if (selectedIndex == 0)
                    const Icon(
                      Icons.check_circle,
                      color: secondaryOrange,
                    )
                  else
                    const SizedBox(width: 20)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => selectedIndex = 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.school_outlined, color: selectedIndex != 1 ? primaryBlue : secondaryOrange),
                Text(
                  "Expert",
                  style: TextStyle(
                      color: selectedIndex != 1 ? primaryBlue : secondaryOrange, fontWeight: FontWeight.bold),
                ),
                if (selectedIndex == 1)
                  const Icon(
                    Icons.check_circle,
                    color: secondaryOrange,
                  )
                else
                  const SizedBox(width: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
