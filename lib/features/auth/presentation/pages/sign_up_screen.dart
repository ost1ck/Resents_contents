import 'package:flutter/material.dart';
import 'package:recents_content/features/auth/data/auth_service.dart';
import 'package:recents_content/features/auth/domain/validators/auth_validators.dart';
import 'package:recents_content/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:recents_content/features/auth/presentation/widgets/auth_background.dart';
import 'package:recents_content/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:recents_content/features/auth/presentation/widgets/message_background.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key,});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final _authService = AuthService();

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
          padding: const EdgeInsetsGeometry.only(top: 275),
        child: Column(
          children: [
            // SizedBox(height: 200),
            Text('Sign Up',
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
              ),
            ),

            SizedBox(height: 26),

            AuthTextField(
              controller: _emailController,
              hintText: "Enter email",
              icon: Icons.email,
              isPassword: false,

              validator: Validators.emailValidator
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(
                  onPressed: () async{
                    if(_formKey.currentState!.validate()) {
                        final error = await _authService.signUp(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim()
                        );

                        if(!context.mounted) return;
                        if(error != null){

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
                                message: "Success registration!",
                                gradientColors: [
                                  Color(0xFF093028),
                                  Color(0xFF237a57),
                                ],
                              )
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen())
                          );
                        }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,

                    padding: const EdgeInsets.all(12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26))
                    )
                  ),
                  child: const Text(
                    'Sign up ',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400
                    ),
                  )
              )
            ),
          ],
        )
        )
        )
      ),
    );
  }
}
