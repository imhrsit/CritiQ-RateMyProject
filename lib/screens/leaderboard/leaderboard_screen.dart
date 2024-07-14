import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            snap: false,
            pinned: true,
            backgroundColor: kgreyopacity,
            expandedHeight: 50,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Leaderboard',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 26,
                ),
              ),
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: 10),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(
                'Coming soon',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 26,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}