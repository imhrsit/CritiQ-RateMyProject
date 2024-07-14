import 'package:critiq/global/color.dart';
import 'package:critiq/screens/competition/competition_screen.dart';
import 'package:critiq/screens/home/home_screen.dart';
import 'package:critiq/screens/leaderboard/leaderboard_screen.dart';
import 'package:critiq/screens/userProfile/userprofile_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      gestureNavigationEnabled: true,
      backgroundColor: kgrey,
      controller: PersistentTabController(initialIndex: 0),
      popAllScreensOnTapAnyTabs: true,
      tabs: [
        PersistentTabConfig(
          screen: Homescreen(),
          item: ItemConfig(icon: Icon(Icons.home_rounded), title: "Home"),
          ),
        PersistentTabConfig(
          screen: CompetitionScreen(),
          item: ItemConfig(icon: Icon(Icons.code_rounded), title: "Competitions"),
          ),
        PersistentTabConfig(
          screen: LeaderboardScreen(),
          item: ItemConfig(icon: Icon(Icons.format_list_numbered_rounded), title: "Leaderboard"),
          ),
        PersistentTabConfig(
          screen: UserProfileScreen(),
          item: ItemConfig(icon: Icon(Icons.person), title: "Profile"),
          ),
      ],
      navBarBuilder: (navBarConfig) => Style10BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: kwhite.withOpacity(0.5),
          ),
        ),
      );
  }
}