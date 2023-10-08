import 'package:aqua_explore/pages/page_switcher_items/profil_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      body: const [HomePage(), LearnPage(), ChasePage(), ProfilPage()][_selectedIndex],
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))],
          ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              textStyle: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              duration: const Duration(milliseconds: 500),
              color: Theme.of(context).textTheme.bodyMedium!.color,
              tabs: [
                GButton(
                  iconActiveColor: Colors.white,
                  icon: Icons.home,
                  backgroundColor: Theme.of(context).primaryColor,
                  text: 'Accueil',
                ),
                GButton(
                  // iconActiveColor: Theme.of(context).scaffoldBackgroundColor,
                  iconActiveColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icons.category,
                  text: 'Catégories',
                ),
                GButton(
                  iconActiveColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icons.shopping_bag_rounded,
                  text: 'Commandes',
                ),
                GButton(
                  iconActiveColor: Colors.white,
                  // iconActiveColor: Theme.of(context).scaffoldBackgroundColor,
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icons.person,
                  text: 'Profil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() => _selectedIndex = index);
              },
            ),
          ))),
    );
  }
}
