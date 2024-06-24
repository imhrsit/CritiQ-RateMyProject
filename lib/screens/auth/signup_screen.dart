import 'package:critiq/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:critiq/global/color.dart';

class Signup extends StatefulWidget {
  Signup(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.nameController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isSignupTapped = false;
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
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextfield(
            controller: widget.emailController,
            hinttext: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextfield(
            controller: widget.passwordController,
            hinttext: "Password",
            keyboardType: TextInputType.visiblePassword,
          ),
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () {
              setState(() {
                isSignupTapped = true;
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
                child: isSignupTapped
                    ? const CircularProgressIndicator(
                        color: kwhite,
                      )
                    : const Text(
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