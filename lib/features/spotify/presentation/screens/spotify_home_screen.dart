import "package:flutter/material.dart";
import "package:recents_content/features/spotify/presentation/widgets/auth_spotify.dart";

class SpotifyHomeScreen extends StatelessWidget {
  const SpotifyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Spotify',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400
          ),
        ),

        AuthSpotify(
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
                height: 1.2,
                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                    offset: Offset(2, 2)
                  )
                ]
              ),
            )
        )
      ],
    );
  }
}
