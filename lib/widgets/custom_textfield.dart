import 'package:critiq/global/color.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hinttext;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const CustomTextfield({super.key, required this.hinttext, this.keyboardType, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(
          color: kwhite,
        ),
      ),
    );
  }
}