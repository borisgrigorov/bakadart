class LoginData {
  String userId;
  String accessToken;
  String refreshToken;
  String tokenType;
  DateTime expiresIn;
  int expiresInSec;

  LoginData({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.expiresInSec,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      userId: json["bak:UserId"],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
      tokenType: json["token_type"],
      expiresInSec: json["expires_in"],
      expiresIn: DateTime.now().add(Duration(seconds: json["expires_in"])),
    );
  }

  @override
  String toString() {
    return "LoginData(userId: $userId, accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn)";
  }
}
