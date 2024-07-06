import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class CompetitionScreen extends StatelessWidget {
  const CompetitionScreen({super.key});

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
                'Hackathons',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 26,
                ),
              ),
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: 10),
            ),
          )
        ],
      ),
    );
  }
}