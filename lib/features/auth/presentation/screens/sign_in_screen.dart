import 'package:flutter/material.dart';
import 'package:recents_content/features/auth/data/auth_service.dart';
import 'package:recents_content/features/auth/domain/validators/auth_validators.dart';
import 'package:recents_content/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:recents_content/features/auth/presentation/widgets/auth_background.dart';
import 'package:recents_content/features/auth/presentation/widgets/auth_form_field.dart';
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
  
  final _authService = AuthService();

  //перевірка авторизації
  bool _isLoading = false;

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
          child: Padding(
              padding: const EdgeInsets.only(top: 275),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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

              const SizedBox(height: 26),

              AuthTextField(
                  controller: _passwordController,
                  hintText: "Enter password",
                  icon: Icons.password,
                  isPassword: true,

                  validator: Validators.passwordValidator,
              ),

              const SizedBox(height: 40),

              AuthFormField(
                isLoading: _isLoading,
                text: 'Sign In',
                onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });

                          try {
                            final error = await _authService.signIn(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim()
                            );

                            if (!context.mounted) return;

                            if (error != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error),
                                ),
                              );
                              return;
                            }
                            showTopSnackBar(
                                Overlay.of(context),
                                const MessageBackground(
                                    message: "Success authorization",
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
                          }finally{
                            if(mounted){
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        }
                      },
                ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen())
                  );
                },
                child: const Text('Don\'t have account',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  ),
                ),
              )
            ],
          )
      )
      ),
      )
    );
  }
}
