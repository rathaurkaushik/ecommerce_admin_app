import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final double borderRadius;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.maxLines,
    this.onChanged,
    this.borderRadius = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
