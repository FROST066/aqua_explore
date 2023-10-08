import 'package:aqua_explore/pages/page_switcher_items/profil_page.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'page_switcher_items/chase_page.dart';
import 'page_switcher_items/home_page.dart';
import 'page_switcher_items/learn_page.dart';

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({super.key});
  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: const [HomePage(), LearnPage(), ChasePage(), ProfilPage()][_selectedIndex],
      bottomNavigationBar: CustomBottomBar(
          selectedIndex: _selectedIndex,
          onChanged: (e) => setState(() => _selectedIndex = e),
          foregroundColor: _selectedIndex.isEven ? primaryBlue : Colors.white,
          backgroundColor: _selectedIndex.isOdd ? primaryBlue : Colors.white),
    );
  }
}
