import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recents_content/features/auth/logic/auth_validators.dart';
import 'package:recents_content/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:recents_content/features/auth/presentation/widgets/auth_background.dart';
import 'package:recents_content/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:recents_content/features/auth/presentation/widgets/message_background.dart';
import 'package:recents_content/features/home/presentation/screens/home_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState(){
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthBackground(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 2)
                      )
                    ]
                )
              ),

              const SizedBox(height: 26),

              AuthTextField(
                  controller: _emailController,
                  hintText: "Enter email",
                  icon: Icons.email,
                  isPassword: false,

                  validator: Validators.emailValidator,
              ),

              SizedBox(height: 40),

              AuthTextField(
                  controller: _passwordController,
                  hintText: "Enter password",
                  icon: Icons.password,
                  isPassword: true,

                  validator: Validators.passwordValidator,
              ),

              SizedBox(height: 40),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                    onPressed: () async {
                      try{
                        if(_formKey.currentState!.validate()) {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim()
                          );

                          if (context.mounted) {
                            showTopSnackBar(
                                Overlay.of(context),
                                const MessageBackground(
                                    message: "Success autorization!",
                                    gradientColors: [
                                      Color(0xFF093028),
                                      Color(0xFF237a57),
                                    ]
                                )
                            );

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen())
                            );
                          }
                        }
                      }
                      on FirebaseAuthException catch (error){
                        print('Error Firebase: ${error.code}');

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(error.message ?? 'Error autorization!')
                          )
                        );
                      }
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    
                    padding: const EdgeInsets.all(12),
                    // elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    )
                  ),
                  child: Text('Sign in',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen())
                  );
                },
                child: Text('Don\'t have account',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  ),
                ),
              )
            ],
          )
      ),
      )
    );
  }
}
