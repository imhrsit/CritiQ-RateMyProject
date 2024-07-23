import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

// import 'package:critiq/providers/user_provider.dart';
// import 'package:provider/provider.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: kgrey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
            floating: true,
            snap: true,
            pinned: false,
            backgroundColor: kgreyopacity,
            expandedHeight: 50,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Leaderboard',
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          primary: true,
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: width * 0.25,
                            height: height * 0.2,
                            child: Image.asset(
                              'assets/jack_image2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: width * 0.25,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                              color: kyellow,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.01),
                                Text(
                                  'User 2',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                Text(
                                  '0 points',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: height * 0.04),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: width * 0.25,
                            height: height * 0.2,
                            child: Image.asset(
                              'assets/jack_image_1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: width * 0.25,
                            height: height * 0.25,
                            decoration: BoxDecoration(
                              color: kdarkBlueMuted,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.01),
                                Text(
                                  'User 1',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: height * 0.03),
                                Text(
                                  '0 points',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: height * 0.08),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: width * 0.25,
                            height: height * 0.19,
                            child: Image.asset(
                              'assets/jack_image_4.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: width * 0.25,
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              color: kpurple,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.005),
                                Text(
                                  'User 3',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                Text(
                                  '0 points',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: height * 0.004),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    color: kDefaultIconLightColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //below graph content
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      // Replace the following placeholders with actual data
                      String rank = (index + 1).toString();
                      String name = 'User ${index + 1}';
                      String points = '0 points';
                  
                      return ListTile(
                        contentPadding: EdgeInsets.all(5),
                        leading: Text(
                          rank,
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        title: Text(
                          name,
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        subtitle: Text(
                          points,
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 20,
                          ),
                        ),
                        trailing: Text(
                          'USICT',
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
        )
          )
      );
  }
}