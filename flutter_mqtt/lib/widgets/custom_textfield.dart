import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.enable = true,
    this.hint,
  }) : super(key: key);
  final TextEditingController controller;
  final bool enable;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
        enabled: enable,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
          labelText: hint,
        ));
  }
}
