import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
                'CritiQ',
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
                'Rate your projects here!',
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