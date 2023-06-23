class AuthSessionDto {
  final String accessToken;
  final String expirationDate;

  const AuthSessionDto({
    required this.accessToken,
    required this.expirationDate,
  });

  factory AuthSessionDto.fromJson(Map<String, dynamic> json) {
    return AuthSessionDto(
      accessToken: json['token'],
      expirationDate: json['expiration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': accessToken,
      'expiration': expirationDate,
    };
  }
}
