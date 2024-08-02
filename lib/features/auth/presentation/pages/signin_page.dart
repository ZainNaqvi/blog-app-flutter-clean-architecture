import 'package:blog_app_with_clean_architecture/core/theme/app_pallate.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/pages/signup_page.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/widgets/auth_gredient_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Sign In.', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              AuthField(hintText: "Email", controller: emailController),
              const SizedBox(height: 15),
              AuthField(hintText: "Password", isObscureText: true, controller: passwordController),
              const SizedBox(height: 20),
              AuthGradientButton(
                btnText: "Sign in",
                callback: () {},
              ),
              const SizedBox(height: 15),
              const AlreadyHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Don\'t have an account? ',
        style: Theme.of(context).textTheme.titleMedium,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SignUpPage();
                    },
                  )),
            text: 'Sign Up',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppPallete.gradient2,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
