import "package:flutter/material.dart";

class AuthTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validator;


  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: controller,
      obscureText: isPassword,
      validator: validator,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          borderSide: BorderSide(color: Colors.white)
        ),

        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          borderSide: BorderSide(color: Colors.grey)
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(26)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: Icon(icon,
          color: Colors.white,
        )
      ),
    ),
    );
  }
}
