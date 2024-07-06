import 'package:critiq/global/color.dart';
import 'package:critiq/services/auth_services.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  void signoutUser(BuildContext context){
    AuthService().signOutUser(context);
  }

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
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app_outlined, color: kwhite),
                padding: const EdgeInsets.only(right: 20),
                onPressed: () {
                  AuthService().signOutUser(context);
                },
              ),
            ],
            backgroundColor: kgreyopacity,
            expandedHeight: 50,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Profile',
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