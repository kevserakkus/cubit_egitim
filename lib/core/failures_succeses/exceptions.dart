class LoginException implements Exception {
  final String? message;

  const LoginException({this.message});
}

class RegisterException implements Exception {
  final String? message;

  RegisterException({this.message});
}
