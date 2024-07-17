import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class CompetitionScreen extends StatelessWidget {
  const CompetitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              pinned: false,
              backgroundColor: kgreyopacity,
              expandedHeight: 50,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Competitions',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 26,
                  ),
                ),
                centerTitle: true,
                titlePadding: EdgeInsets.only(bottom: 10),
              ),
            ),
          ];
        },
        body: Center(
          child: Text(
            'Coming soon',
            style: TextStyle(
              color: kwhite,
              fontSize: 26,
            ),
          ),
        ),
        )
    );
  }
}