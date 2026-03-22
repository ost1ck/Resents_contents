import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottom extends StatefulWidget {
  const AppBottom({super.key});

  @override
  State<AppBottom> createState() => _AppBottomState();
}

class _AppBottomState extends State<AppBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF152331),
              Color(0xFF000000),
            ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      child: SafeArea(
        bottom: true,
          top: false,

          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                IconButton(
                    icon: FaIcon(FontAwesomeIcons.youtube, color: Colors.red, size: 32),
                    onPressed: (){

                    }),


                FaIcon(FontAwesomeIcons.film, color: Colors.grey, size: 32),
                FaIcon(FontAwesomeIcons.spotify, color: Colors.green, size: 32),
              ],
            ),
          )
      ),
    );
  }
}
