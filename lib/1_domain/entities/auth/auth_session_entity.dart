class AuthSessionEntity {
  final String accessToken;
  final String expirationDate;

  const AuthSessionEntity({
    required this.accessToken,
    required this.expirationDate,
  });
}
