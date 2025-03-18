class JwtRefreshToken {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  JwtRefreshToken({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });
}
