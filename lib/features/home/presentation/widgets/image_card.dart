import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {

  final String imagePath;

  const ImageCard({
    super.key,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenheight = MediaQuery.sizeOf(context).height;

    return Container(
      height: screenheight * 0.35,
      width: screenWidth * 0.85,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            offset: Offset(0, 8)
          )
        ]
      ),

      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(18),
        child: Image.asset(
            imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
