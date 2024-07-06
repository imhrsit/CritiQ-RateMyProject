import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:critiq/global/color.dart';
import 'package:critiq/screens/competition/competition_screen.dart';
import 'package:critiq/screens/home/home_screen.dart';
import 'package:critiq/screens/leaderboard/leaderboard_screen.dart';
import 'package:critiq/screens/userProfile/userprofile_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final _pages = [
    const Homescreen(),
    const CompetitionScreen(),
    const LeaderboardScreen(),
    const UserProfileScreen(),
  ];

  var _selected = 0;

  void _changeScreen(val) {
    setState(() {
      _selected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      body: _pages[_selected],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: BottomNavyBar(
          backgroundColor: kgreyopacity,
          showElevation: false,
          items: [
            BottomNavyBarItem(
              activeColor: kwhite,
              title: Text(
                "Home",
                style: TextStyle(
                  color: kblackHeading,
                ),
              ),
              icon: SizedBox(
                child: Icon(
                  Icons.home_filled,
                  color: kblackHeading,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: kwhite,
              title: Text(
                "Hackathons",
                style: TextStyle(
                  color: kblackHeading,
                ),
              ),
              icon: SizedBox(
                child: Icon(
                  Icons.code_rounded,
                  color: kblackHeading,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: kwhite,
              title: Text(
                "Leaderboard",
                style: TextStyle(
                  color: kblackHeading,
                ),
              ),
              icon: SizedBox(
                child: Icon(
                  Icons.format_list_numbered_rounded,
                  color: kblackHeading,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: kwhite,
              title: Text(
                "Profile",
                style: TextStyle(
                  color: kblackHeading,
                ),
              ),
              icon: SizedBox(
                child: Icon(
                  Icons.person,
                  color: kblackHeading,
                ),
              ),
            ),
          ],
          selectedIndex: _selected,
          onItemSelected: _changeScreen,
        ),
      ),
    );
  }
}