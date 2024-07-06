import 'package:flutter/material.dart';
import 'package:critiq/global/color.dart';

import 'package:critiq/screens/auth/login_screen.dart';
import 'package:critiq/screens/auth/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  int activeTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    void setActiveTabIndex() {
      setState(() {
        activeTabIndex = _tabController.index;
      });
    }
    _tabController.addListener(setActiveTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kgrey,
        leading: IconButton(
    icon: Icon(
      Icons.arrow_back_ios_rounded,
    color: kwhite,),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
      ),
      backgroundColor: kgrey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 90),
                child: const Text(
                    'CritiQ',
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
              ),
              Container(
                height: 60,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          surfaceVariant: Colors.transparent,
                        ),
                  ),
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: activeTabIndex == 0 ? kwhite : kgreyopacity,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: kblackHeading),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: activeTabIndex == 1 ? kwhite : kgreyopacity,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  color: kblackHeading),
                            ),
                          ),
                        ),
                      ),
                    ],
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    controller: _tabController,
                    isScrollable: true,
                                
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Signup(
                        emailController: emailController,
                        passwordController: passwordController,
                        nameController: nameController),
                    Login(
                        emailController: emailController,
                        passwordController: passwordController),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}