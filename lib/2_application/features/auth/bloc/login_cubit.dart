import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../1_domain/entities/auth/auth_session_entity.dart';
import '../../../../1_domain/entities/auth/login_entity.dart';
import '../../../../1_domain/use_cases/auth_usecase.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final AuthUseCase authUseCase;
  final LoginEntity loginEntity = LoginEntity.empty();

  LoginCubit({
    required this.authUseCase,
  }) : super(const LoginCubitInitial());

  void init() {}

  void login(String username, String password, bool isRememberMe) async {
    emit(const LoginLoadingState());

//Note: it will shorten request time.
    final responseFuture = authUseCase.login(username, password, isRememberMe);
    final response = await responseFuture;

    response.fold(
      (l) => emit(const LoginErrorState()),
      (r) => emit(
        LoginLoadedState(
            authSession: AuthSessionEntity(
          accessToken: r.accessToken,
          expirationDate: r.expirationDate,
        )),
      ),
    );
  }
}
