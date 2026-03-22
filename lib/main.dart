import 'package:flutter/material.dart';
import 'package:recents_content/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:recents_content/features/auth/presentation/pages/sign_up_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const RecentMyContent());
}

class RecentMyContent extends StatelessWidget {
  const RecentMyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
