import 'package:flutter/material.dart';
import 'package:recents_content/features/home/presentation/widgets/app_bottom.dart';
import 'package:recents_content/features/home/presentation/widgets/home_background.dart';
import 'package:recents_content/features/home/presentation/widgets/image_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageCard(imagePath: 'assets/images/home_picture.jpeg'),

              SizedBox(height: 40),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              child:
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(text: "Welcome to my pet project!\n\n"),
                      TextSpan(text: "This app is a unified hub for all your recently consumed media. Here you can easily track your latest "),

                      TextSpan(
                          text: "YouTube",
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(text: " videos, "),

                      TextSpan(
                          text: "Movies",
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(text: ", and "),

                      TextSpan(
                          text: "Spotify",
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(text: " tracks.\n\n"),

                      TextSpan(text: "I hope you enjoy the experience!"),
                    ]
                ),
              )
              ),
            ],
          )
      ),
      bottomNavigationBar: AppBottom()
    );
  }
}
