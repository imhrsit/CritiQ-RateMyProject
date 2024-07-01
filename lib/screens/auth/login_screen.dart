import 'package:flutter/material.dart';
import 'package:critiq/global/color.dart';

import 'package:critiq/services/auth_services.dart';
import 'package:critiq/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  Login(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthService authService = AuthService();

  void loginUser(BuildContext context) {
    authService.logInUser( 
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Column(
        children: [
          CustomTextfield(
            controller: widget.emailController,
            hinttext: "Email",
            keyboardType: TextInputType.emailAddress,
            textStyle: TextStyle(color: kwhite),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextfield(
            controller: widget.passwordController,
            hinttext: "Password",
            keyboardType: TextInputType.visiblePassword,
            textStyle: TextStyle(color: kwhite),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              widget.loginUser(context);
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kgreyopacity,
              ),
              child: const Center(
                child: Text(
                        "Log In",
                        style: TextStyle(color: kwhite),
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}