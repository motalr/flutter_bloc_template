part of 'login_cubit.dart';

abstract class LoginCubitState extends Equatable {
  const LoginCubitState();

  @override
  List<Object> get props => [];
}

class LoginCubitInitial extends LoginCubitState {
  const LoginCubitInitial();
}

class LoginLoadingState extends LoginCubitState {
  const LoginLoadingState();
}

class LoginLoadedState extends LoginCubitState {
  final AuthSessionEntity authSession;

  const LoginLoadedState({
    required this.authSession,
  });

  @override
  List<Object> get props => [authSession];
}

class LoginErrorState extends LoginCubitState {
  const LoginErrorState();
}
