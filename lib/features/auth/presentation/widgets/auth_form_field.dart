import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final bool isLoading;
  final String text;
  final Future<void> Function()? onPressed;

  const AuthFormField({
    super.key,
    required this.isLoading,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 100),

      child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26)
          ),
        ),
        child: isLoading
          ?  const SizedBox(
          width: 10,
          height: 10,
          child: CircularProgressIndicator(
            color: Colors.green,
            strokeWidth: 2,
          ),
        )
            : Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        )
      ),
    );
  }
}
