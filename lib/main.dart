import 'package:blog_app_with_clean_architecture/core/theme/theme.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeMode,
      home: const SignUpPage(),
    );
  }
}
