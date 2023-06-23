import 'package:booktaxi/0_data/dio_client.dart';
import 'package:booktaxi/0_data/services/auth_api.dart';
import 'package:booktaxi/1_domain/logger/logger.dart';
import 'package:booktaxi/1_domain/logger/logger_impl/logger_impl.dart';
import 'package:booktaxi/2_application/features/auth/bloc/login_cubit.dart';
import 'package:get_it/get_it.dart';
import '../0_data/repositories/auth_repository_impl.dart';
import '../1_domain/repositories/auth_repository.dart';
import '../1_domain/use_case_impl/auth_usecase_impl.dart';
import '../1_domain/use_cases/auth_usecase.dart';
import 'package:http/http.dart' as http;
import '../0_data/config.dart' as config;

//Note: container = Service Locator / Dependency container.
final sl = GetIt.I;

Future<void> init() async {
  Future.wait(
    [
      registerOtherServices(),
      registerCubits(),
      registerUseCases(),
      registerRestApis(),
      registerRepositories(),
    ],
  );
}

Future<void> registerCubits() async {
  sl.registerFactory(() => LoginCubit(authUseCase: sl()));
}

Future<void> registerUseCases() async {
  sl.registerFactory<AuthUseCase>(() => AuthUseCaseImpl(authRepo: sl()));
}

Future<void> registerRestApis() async {
  var dio = buildDioClient(config.baseUrl);
  sl.registerLazySingleton<AuthApi>(() => AuthApi(dio));
}

Future<void> registerRepositories() async {
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
        authApi: sl(),
        logger: sl(),
      ));
}

Future<void> registerOtherServices() async {
  sl.registerFactory(() => http.Client());
  sl.registerLazySingleton<Logger>(() => LoggerImpl());
}
