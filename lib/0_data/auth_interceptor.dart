import 'dart:convert';

import 'package:booktaxi/0_data/models/dtos/auth_session_dto.dart';
import 'package:booktaxi/1_domain/constants/preference_constants.dart';
import 'package:dio/dio.dart';
import '../core/preference.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //Note: can handles token validation, refresh and logging.

    options.headers['Content-Type'] = 'application/json';

    final bool isUserLoggedIn = await Preference.instance
        .get<bool>(PreferenceConstants.isUserLoggedInKey);

    if (isUserLoggedIn) {
      final String token = await getAccessToken();
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  Future<String> getAccessToken() async {
    try {
      final String userSessionJsonString = await Preference.instance
          .get<String>(PreferenceConstants.userAuthSessionKey);
      final Map<String, dynamic> userSessionJson =
          json.decode(userSessionJsonString);

      return AuthSessionDto.fromJson(userSessionJson).accessToken;
    } on Exception catch (_) {
      //logger.log('AuthInterceptor -> getAccessToken', e);
      return '';
    }
  }
}
