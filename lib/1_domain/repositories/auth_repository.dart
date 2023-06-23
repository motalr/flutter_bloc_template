import 'package:booktaxi/0_data/models/requests/login_request.dart';
import 'package:dartz/dartz.dart';
import '../entities/auth/auth_session_entity.dart';
import '../failures/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthSessionEntity>> login(LoginRequest request);
}
