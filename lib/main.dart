import 'package:critiq/providers/user_provider.dart';
import 'package:critiq/screens/home/home_screen.dart';
import 'package:critiq/screens/welcome/welcome_screen.dart';
import 'package:critiq/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
    child: const MyApp()
    ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AuthService authService = AuthService();

  @override
  void initState() {
    authService.getUserData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CritiQ',
      home: Provider.of<UserProvider>(context).user.token.isEmpty ? const WelcomeScreen() : const Homescreen(),
    );
  }
}