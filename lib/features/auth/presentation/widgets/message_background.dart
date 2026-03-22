import 'package:flutter/material.dart';

class MessageBackground extends StatelessWidget {

  final String message;
  final List<Color> gradientColors;

  const MessageBackground({
    super.key,
    required this.message,
    required this.gradientColors
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(26),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
              offset: Offset(4, 4)
            )
          ]
        ),

        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
