import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glowvy/Screens/auth_screens/create_account_screen.dart';
import 'package:glowvy/Utils/app_assets.dart';
import 'package:glowvy/Utils/app_text.dart';
import 'package:glowvy/Utils/app_theme.dart';
import 'package:glowvy/widgets/custom_text_field.dart';
import 'package:glowvy/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              /// Title
              Text(
                'Login to your account',
                style: AppFontStyles.titleBold(
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'It\'s great to see you again.',
                style: AppFontStyles.titleRegular(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 18),

              /// Email
              _label('Email'),
              const CustomTextField(
                hintText: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 14),

              /// Password
              _label('Password'),
              CustomTextField(
                hintText: 'Enter your password',
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),

              const SizedBox(height: 12),

              /// Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forgot your password?',
                    style: AppFontStyles.titleSemiBold(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Text(
                    'Reset your password',
                    style: AppFontStyles.titleMedium(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: AppFontStyles.titleSemiBold(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// OR Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Or',
                      style: AppFontStyles.titleRegular(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

              /// Google Button
              SocialButton(
                icon: AppAssets.googleIcon,
                text: 'Login with Google',
                onPressed: () {},
              ),

              const SizedBox(height: 16),

              /// Facebook Button
              SocialButton(
                icon: AppAssets.facebookIcon,
                text: 'Login with Facebook',
                onPressed: () {},
              ),

              const SizedBox(height: 40),

              /// Sign Up Link
              Center(
                child: RichText(
                  text: TextSpan(
                    style: AppFontStyles.titleRegular(fontSize: 14, color: Colors.grey),
                    children: [
                      const TextSpan(text: 'Don\'t have an account? '),
                      TextSpan(
                        text: 'Join',
                        style: AppFontStyles.titleSemiBold(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              loginRoute(const CreateAccountScreen()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// Widgets
  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: AppFontStyles.titleMedium(
          fontSize: 14,
        ),
      ),
    );
  }
}

Route loginRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        ),
      );
    },
  );
}

