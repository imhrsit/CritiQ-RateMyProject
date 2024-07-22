import 'dart:convert';

import 'package:critiq/screens/auth/auth_screen.dart';
import 'package:critiq/widgets/navbarScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:critiq/models/user_model.dart';
import 'package:critiq/global/utils.dart';
import 'package:critiq/global/constants.dart';
import 'package:critiq/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AuthService{
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
    required String college,

  }) async {
    try {
      User user = User(
        id: '',
        email: email,
        name: name,
        token: '',
        password: password,
        college: college,
      );

      http.Response response = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson(),
      );
      httpErrorHandle(
        context: context,
        response: response,
        onSuccess: (){
          showSnackbar(context, "Account created! Log in to get started.");
        },
        );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void logInUser({
    required BuildContext context,
    required String email,
    required String password, 
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response response = await http.post(
        Uri.parse('${Constants.uri}/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password, 
        }),
      );
      httpErrorHandle(
        context: context,
        response: response,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(response.body);
          await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const NavBarScreen(),
            ),
            (route) => false,
            );
        },
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if(token == null){
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('${Constants.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );
      var response = jsonDecode(tokenRes.body);
      if(response==true){
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );
        userProvider.setUser(userRes.body); 
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void signOutUser(BuildContext context) async {
    try {
      final navigator = Navigator.of(context, rootNavigator: true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('x-auth-token', '');
      navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const AuthScreen()), (Route<dynamic> route) => false);
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  } 
}