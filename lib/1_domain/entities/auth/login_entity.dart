import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String username;
  final String password;
  final bool isRememberMe;

  const LoginEntity({
    required this.username,
    required this.password,
    required this.isRememberMe,
  });

  factory LoginEntity.empty() {
    return const LoginEntity(
      password: '',
      username: '',
      isRememberMe: false,
    );
  }

  LoginEntity copyWith({
    String? username,
    String? password,
    bool? isRememberMe,
  }) {
    return LoginEntity(
      username: username ?? this.username,
      password: password ?? this.password,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        isRememberMe,
      ];
}
