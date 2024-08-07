import 'package:blog_app_with_clean_architecture/core/theme/theme.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/pages/signin_page.dart';
import 'package:blog_app_with_clean_architecture/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<AuthBloc>())],
      child: const MainApp(),
    ),
  );
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
