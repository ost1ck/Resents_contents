import 'package:flutter/material.dart';

class AuthSpotify extends StatelessWidget {

  final Widget child;

  const AuthSpotify({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
             blurRadius: 8,
            offset:  Offset(2, 2)
          )
        ]
      ),

      child: child,
    );
  }
}
