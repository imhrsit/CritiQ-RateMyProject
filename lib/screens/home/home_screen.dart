import 'package:critiq/global/color.dart';
import 'package:critiq/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String _greeting = '';

  void _updateGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (hour < 17) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else {
      setState(() {
        _greeting = 'Good Evening';
      });
    }
  }

  @override
  void initState() {
    _updateGreeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserProvider>(context).user;
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
            flexibleSpace: const FlexibleSpaceBar(
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
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                    color: kgreyopacity,
                    borderRadius: BorderRadius.all(Radius.elliptical(40, 20)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_greeting, ${user.name}',
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 26,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'assets/welcome_image1.png',
                            width: width * 0.5,
                            height: height * 0.23,
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                SizedBox(height: height*0.015),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Evaluate your projects here 👇',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: height*0.015),
                Container(
                  height: height * 0.06,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(color: kwhite),
                    color: kgreyopacity,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                SizedBox(height: height*0.015),
                Center(
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: kwhite,
                        fontSize: 20,
                      ),
                    ),
                  ),
                SizedBox(height: height*0.015),
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    color: kgreyopacity,
                    border: Border.all(color: kwhite),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                SizedBox(height: height*0.015),
                OutlinedButton(
                  onPressed: (){},
                  child: Text(
                    'Analyze',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 20,
                    ),
                  )
                  ),
                SizedBox(height: height*0.015),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recent Projects',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}