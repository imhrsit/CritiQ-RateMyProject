import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey,
      appBar: AppBar(
        title: Text('CritiQ'),
        centerTitle: true,
        backgroundColor: kgrey,
      ),
      body: Center(
        child: Text('Welcome to CritiQ - RateMyProject!', style: TextStyle(color: kwhite, fontSize: 24)),
      ),
    );
  }
}