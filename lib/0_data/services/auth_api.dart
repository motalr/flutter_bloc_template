import 'package:booktaxi/0_data/models/dtos/auth_session_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/requests/login_request.dart';
part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/api/v1/authenticate/login')
  Future<AuthSessionDto> login({@Body() required LoginRequest request});
}
