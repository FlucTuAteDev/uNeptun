import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  const PasswordFormField({super.key, required this.hintText, required this.prefixIcon, this.controller});


  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "A jelszó mező nem lehet üres!";
        }
        
        return null;
      },
      obscureText: obscured,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: IconButton(
          onPressed: () { setState(() {
            obscured = !obscured;
          }); }, 
          icon: Icon(obscured ? Icons.visibility : Icons.visibility_off),
          splashRadius: 20,
        ),
      ),
    );
  }
}