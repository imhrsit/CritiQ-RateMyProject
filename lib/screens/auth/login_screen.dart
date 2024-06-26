import 'package:critiq/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:critiq/global/color.dart';

class Login extends StatefulWidget {
  Login(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoginTapped = false;

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
              setState(() {
                isLoginTapped = true;
              });
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kgreyopacity,
              ),
              child: Center(
                child: isLoginTapped
                    ? CircularProgressIndicator(
                      color: kwhite,
                    )
                    : Text(
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