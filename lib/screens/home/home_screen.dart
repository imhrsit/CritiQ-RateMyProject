import 'package:critiq/global/color.dart';
import 'package:critiq/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: kgrey,
      appBar: AppBar(
        backgroundColor: kgrey,
        title: const Text(
          'CritiQ',
          style: TextStyle(
            color: kwhite,
            fontSize: 26,
            ),
          ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.name,
              style: TextStyle(color: kwhite, fontSize: 24)
              ),
            Text(
              user.email,
              style: TextStyle(color: kwhite, fontSize: 24)
              ),
          ],
        ),
      ),
    );
  }
}