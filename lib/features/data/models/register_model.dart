import 'package:cubbit_egitim/features/domain/entities/register.dart';

class RegisterModel extends RegisterResponse {
  RegisterModel({String? passwordResetCode})
      : super(passwordResetCode: passwordResetCode);

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(passwordResetCode: map['passwordResetCode']);
  }
}

class RegisterModelData extends RegisterResponseData {
  RegisterModelData({RegisterResponse? data, bool? success})
      : super(data: data, succes: success);

  factory RegisterModelData.fromMap(Map<String, dynamic> map) {
    return RegisterModelData(
        data: RegisterModel.fromMap(map['data']), success: map['success']);
  }
}
