import 'package:critiq/screens/userProfile/comingUp.dart';
import 'package:critiq/screens/userProfile/privacyPolicy.dart';
import 'package:critiq/screens/userProfile/termsCond.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:critiq/global/color.dart';
import 'package:critiq/providers/user_provider.dart';
import 'package:critiq/services/auth_services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  void signoutUser(BuildContext context){
    AuthService().signOutUser(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: kgrey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            snap: false,
            pinned: false,
            backgroundColor: kgreyopacity,
            expandedHeight: 50,
            flexibleSpace: const FlexibleSpaceBar(
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
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                SizedBox(height: height*0.04),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: kwhite,
                  child: Icon(
                    //can use file picker to get image
                    Icons.person,
                    size: 100,
                    color: kblackHeading,
                  ),
                ),
                SizedBox(height: height*0.01),
                Text(
                  user.name,
                  style: const TextStyle(
                    color: kwhite,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: height*0.003),
                Text(
                  user.college,
                  style: const TextStyle(
                    color: kwhite,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: height*0.02),
                SizedBox(
                  height: height*0.2,
                  width: width*0.45,
                  child: SfRadialGauge(
                    axes: [
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          cornerStyle: CornerStyle.bothCurve,
                          color: kgreyopacity,
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: 0, //to be change dynamically acc to points later //progressValue
                            cornerStyle: CornerStyle.bothCurve,
                            width: 0.2,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: kdarkBlueMuted,
                            gradient: SweepGradient(colors: <Color>[
                              kdarkBlue,
                              kdarkBlueMuted
                            ],),
                          )
                        ],
                        annotations: const <GaugeAnnotation>[
                          GaugeAnnotation(
                            positionFactor: 0.1,
                            angle: 90,
                            widget: Text(
                              '0/10',
                              style: TextStyle(
                                color: kwhite,
                                fontSize: 24,
                              ),
                            ),
                            )
                        ],
                      ),
                    ],
                  )
                ),
                const Text(
                  'Overall Rating',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: height*0.05),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsConditionScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: kgreyopacity,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        color: kdarkBlue,
                        fontSize: 18,
                      )
                    ),
                  ),
                ),
                SizedBox(height: height*0.01),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: kgreyopacity,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: kdarkBlue,
                        fontSize: 18,
                      )
                    ),
                  ),
                ),
                SizedBox(height: height*0.01),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ComingUpScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: kgreyopacity,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'On the Horizon',
                      style: TextStyle(
                        color: kdarkBlue,
                        fontSize: 18,
                      )
                    ),
                  ),
                ),
                SizedBox(height: height*0.01),
                InkWell(
                  onTap: () {
                    signoutUser(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: kgreyopacity,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: kdarkBlue,
                        fontSize: 18,
                      )
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