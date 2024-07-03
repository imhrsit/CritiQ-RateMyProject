import 'package:critiq/global/color.dart';
import 'package:critiq/providers/user_provider.dart';
import 'package:critiq/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  void signoutUser(BuildContext context){
    AuthService().signOutUser(context);
  }

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: kgrey,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app_outlined, color: kwhite),
            padding: const EdgeInsets.only(right: 20),
            onPressed: () {
              widget.signoutUser(context);
            },
          ),
        ],
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