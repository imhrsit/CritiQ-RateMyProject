import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                  'Privacy Policy',
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
            'CritiQ is committed to protecting your privacy. We collect the following information: Project URLs or APK files you submit for analysis. This data is used solely to power our AI analysis and is not shared with third parties for any purpose other than improving our service. We do not collect any personally identifiable information from you unless you voluntarily provide it. You have the right to request access to, correction of, or deletion of your submitted project data. CritiQ will retain your data for as long as necessary to provide and improve our service, but we will delete it upon your request.',
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