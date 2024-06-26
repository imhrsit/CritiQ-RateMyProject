import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextStyle textStyle;
  final String hinttext;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const CustomTextfield({super.key, required this.hinttext, this.keyboardType, this.controller, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: textStyle,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: kwhite,
          ),
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(
          color: kwhite,
        ),
      ),
    );
  }
}