// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final TextEditingController controller;

  const InputTextField({
    super.key,
    required this.hintText,
    this.isObscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintText is required';
        }
      },
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
