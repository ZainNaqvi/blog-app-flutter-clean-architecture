import 'package:blog_app_with_clean_architecture/core/secrets/app_secrets.dart';
import 'package:blog_app_with_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app_with_clean_architecture/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app_with_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app_with_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app_with_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseProjectUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  sl.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  sl.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));

  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerFactory(() => UserSignUp(sl()));

  sl.registerLazySingleton(() => AuthBloc(userSignUp: sl()));
}
