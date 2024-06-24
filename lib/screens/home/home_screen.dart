import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CritiQ'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Welcome to CritiQ - RateMyProject!'),
      ),
    );
  }
}