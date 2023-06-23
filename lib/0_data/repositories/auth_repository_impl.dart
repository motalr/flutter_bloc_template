import 'dart:convert';
import 'package:booktaxi/0_data/services/auth_api.dart';
import 'package:dartz/dartz.dart';
import 'package:booktaxi/1_domain/failures/failures.dart';
import 'package:booktaxi/1_domain/entities/auth/auth_session_entity.dart';
import '../../1_domain/constants/preference_constants.dart';
import '../../1_domain/logger/logger.dart';
import '../../1_domain/repositories/auth_repository.dart';
import '../../core/preference.dart';
import '../models/requests/login_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  final Logger logger;

  AuthRepositoryImpl({
    required this.authApi,
    required this.logger,
  });

  @override
  Future<Either<Failure, AuthSessionEntity>> login(
    LoginRequest request,
  ) async {
    try {
      //await Future.delayed(const Duration(seconds: 2));

      final response = await authApi.login(request: request);

      Preference.instance
          .set<bool>(PreferenceConstants.isUserLoggedInKey, true);

      Preference.instance.set<String>(
          PreferenceConstants.userAuthSessionKey, json.encode(response));

      return Right(
        AuthSessionEntity(
          accessToken: response.accessToken,
          expirationDate: response.expirationDate,
        ),
      );
    } on Exception catch (e) {
      logger.log('AuthRepositoryImpl', e);
      return Future.value(
        Left(ServerFailure(stackTrace: e.toString())),
      );
    }
  }
}
