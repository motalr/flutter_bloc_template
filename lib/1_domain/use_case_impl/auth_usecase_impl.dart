import 'package:booktaxi/0_data/models/requests/login_request.dart';
import 'package:booktaxi/1_domain/failures/failures.dart';
import 'package:booktaxi/1_domain/entities/auth/auth_session_entity.dart';
import 'package:booktaxi/1_domain/use_cases/auth_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/auth_repository.dart';

class AuthUseCaseImpl implements AuthUseCase {
  final AuthRepository authRepo;

  AuthUseCaseImpl({
    required this.authRepo,
  });

  @override
  Future<Either<Failure, AuthSessionEntity>> login(
      String username, String password, bool isRememberMe) async {
    try {
      username = 'r.motal@blisdigital.com';
      password = '!Pass1231';

      var response = await authRepo.login(LoginRequest(
        username: username,
        password: password,
      ));

      //Todo:if success: save user session;

      return response.fold(
        (l) => Left(l),
        (r) => Right(r),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(
        stackTrace: e.toString(),
      ));
    }
  }

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  Future<Either<Failure, Type>> saveCredentials() {
    // TODO: implement saveCredentials
    throw UnimplementedError();
  }
}
