import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color labelColor;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isNumber;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.isPassword,
    this.keyboardType = TextInputType.text,
    this.labelColor = Colors.black,
    required this.isNumber
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumber ?
        [FilteringTextInputFormatter.digitsOnly] : [],
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
