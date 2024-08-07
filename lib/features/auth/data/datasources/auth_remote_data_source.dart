import 'dart:developer';

import 'package:blog_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:blog_app_with_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> loginWithEmailPassword({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          "name": name,
        },
      );
      if (response.user == null) {
        throw const ServerException('User is null!');
      } else {
        log('User Created Successfully: ${response.user!.id}');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      log('Error: $e', name: 'trycatch');
      throw ServerException(e.toString());
    }
  }
}
