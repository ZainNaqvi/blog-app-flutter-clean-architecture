import 'package:blog_app_with_clean_architecture/core/theme/app_pallate.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/pages/signin_page.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/widgets/auth_gredient_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
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
              const Text('Sign Up.', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              AuthField(hintText: "Name", controller: nameController),
              const SizedBox(height: 15),
              AuthField(hintText: "Email", controller: emailController),
              const SizedBox(height: 15),
              AuthField(hintText: "Password", isObscureText: true, controller: passwordController),
              const SizedBox(height: 20),
              AuthGradientButton(
                callback: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthSignUp(
                            email: emailController.text.trim(),
                            name: nameController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  }
                },
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
        text: 'Already have an account? ',
        style: Theme.of(context).textTheme.titleMedium,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  )),
            text: 'Sign In',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppPallete.gradient2, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
