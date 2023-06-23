import 'package:booktaxi/1_domain/entities/auth/auth_session_entity.dart';
import 'package:dartz/dartz.dart';
import '../failures/failures.dart';

abstract class AuthUseCase {
  Future<Either<Failure, AuthSessionEntity>> login(
    String username,
    String password,
    bool isRememberMe,
  );

  Future<Either<Failure, Type>> saveCredentials();

  void logout();
}
