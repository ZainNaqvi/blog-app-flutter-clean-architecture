import 'package:blog_app_with_clean_architecture/core/error/failures.dart';
import 'package:blog_app_with_clean_architecture/core/usecase/usecase.dart';
import 'package:blog_app_with_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:blog_app_with_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams({
    required this.email,
    required this.name,
    required this.password,
  });
}
