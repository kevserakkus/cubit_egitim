class RegisterResponse {
  final String? passwordResetCode;

  RegisterResponse({this.passwordResetCode});
}

class RegisterResponseData {
  final RegisterResponse? data;
  final bool? succes;

  RegisterResponseData({this.data, this.succes});
}
