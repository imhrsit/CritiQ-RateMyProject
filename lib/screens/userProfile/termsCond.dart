import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

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
                  'Terms and Conditions',
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
            'By using Critiq, you agree to the following terms: Critiq is an AI-powered app that analyzes projects submitted via URL or APK and provides automated ratings and reviews. Critiq does not guarantee the accuracy or completeness of its AI-generated assessments, which are for informational purposes only and should not be considered professional advice. You are solely responsible for the content you submit and its compliance with all applicable laws and regulations. Critiq reserves the right to modify or discontinue the service at any time without notice. Your use of Critiq constitutes acceptance of these terms and conditions.',
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