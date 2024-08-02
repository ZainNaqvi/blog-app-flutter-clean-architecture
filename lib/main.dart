import 'package:blog_app_with_clean_architecture/core/secrets/app_secrets.dart';
import 'package:blog_app_with_clean_architecture/core/theme/theme.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseProjectUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
