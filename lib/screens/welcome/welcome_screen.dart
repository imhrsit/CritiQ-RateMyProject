import 'package:critiq/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:critiq/global/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = Tween<double>(
      begin: -50,
      end: 50,
    ).animate(controller!)
      ..addListener(() {
        setState(() {});
        if (controller!.isCompleted) {
          controller!.reverse();
        }
        if (controller!.isDismissed) {
          controller!.forward();
        }
      });
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kgrey,
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'CritiQ',
                  style: TextStyle(
                      color: kwhite,
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Rate and Improve your',
                  style: TextStyle(color: kwhite),
                ),
                Text(
                  'personal projects!',
                  style: TextStyle(color: kwhite),
                ),
                Spacer(),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  transform: Transform.translate(
                    offset: Offset(0, animation!.value),
                  ).transform,
                  child: Hero(
                    tag: "welcome",
                    child: Container(
                      height: 400,
                      child: Image.asset('assets/welcome_image2.png'),
                      decoration: BoxDecoration(
                          ),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kgrey.withOpacity(0.5),
                      foregroundColor: kwhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                    child: Text('Get Started', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            )
          ]),
        );
  }
}