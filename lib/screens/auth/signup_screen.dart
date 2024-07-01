import 'package:flutter/material.dart';
import 'package:critiq/global/color.dart';

import 'package:critiq/services/auth_services.dart';
import 'package:critiq/widgets/custom_textfield.dart';

class Signup extends StatefulWidget {
  Signup(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.nameController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final AuthService authService = AuthService();

  void signupUser(BuildContext context){
    authService.signUpUser(
      context: context,
      email: emailController.text,
      name: nameController.text,
      password: passwordController.text,
    );
  }

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Column(
        children: [
          CustomTextfield(
            controller: widget.nameController,
            hinttext: "Name",
            keyboardType: TextInputType.name,
            textStyle: TextStyle(color: kwhite),
          ),
          const SizedBox(
            height: 16,
          ),
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
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () {
              widget.signupUser(context);
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
                        "Sign Up",
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