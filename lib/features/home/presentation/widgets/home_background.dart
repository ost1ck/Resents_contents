import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {

  final Widget child;

  const HomeBackground({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFFabbaab),
              Color(0xFFffffff),
            ],
          begin: Alignment.topLeft,
        ),
      ),

      child: child,
    );
  }
}

