import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class ComingUpScreen extends StatelessWidget {
  const ComingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      body: NestedScrollView(
        scrollBehavior: const MaterialScrollBehavior(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: kwhite,)
                ),
              floating: true,
              snap: true,
              pinned: false,
              backgroundColor: kgreyopacity,
              expandedHeight: 50,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'On the Horizon',
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
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Elevate your hackathons and competitions with CritiQ`s innovative new feature! Create dedicated competitions within the app, eliminating the need for cumbersome devfolios or Google Form submissions. Our AI-powered evaluation system will automatically assess projects based on your custom criteria, ensuring a fair and transparent judging process. Winners will be crowned with confidence, and detailed credits will be awarded for each category, fostering healthy competition and recognizing individual achievements. Stay tuned for this game-changing update!',
            style: TextStyle(
              color: kwhite,
              fontSize: 20,
            ),
            ),
        ),
        ),
    );
  }
}