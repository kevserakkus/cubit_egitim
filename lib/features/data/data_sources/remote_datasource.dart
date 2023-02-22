import 'package:cubbit_egitim/core/consts/apiconst.dart';
import 'package:cubbit_egitim/core/failures_succeses/exceptions.dart';
import 'package:cubbit_egitim/core/services/api_service.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/data/models/login_model.dart';
import 'package:cubbit_egitim/features/data/models/register_model.dart';

abstract class RemoteDataSource {
  Future<LoginModelData> login(
      String? sign, String? password, String? deviceId, int userDeviceTypeId);

  Future<RegisterModelData> register(
      String? sign, String? password, int? languageid);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService _apiService = instance<ApiService>();

  @override
  Future<LoginModelData> login(String? sign, String? password, String? deviceId,
      int userDeviceTypeId) async {
    try {
      Map<String, dynamic> data =
          await _apiService.getData(ApiConsts.loginUrl, {
        'sign': '$sign',
        'password': '$password',
        'deviceId': '$deviceId',
        'userDeviceTypeId': '$userDeviceTypeId'
      });

      LoginModel loginModel = LoginModel.fromMap(data['data']);
      LoginModelData loginModelData = LoginModelData.fromMap(data);
      return loginModelData;
    } catch (e) {
      throw LoginException(message: 'Giriş Yapılamadı');
    }
  }

  @override
  Future<RegisterModelData> register(
      String? sign, String? password, int? languageId) async {
    try {
      Map<String, dynamic> data = await _apiService.getData(
          ApiConsts.registerUrl, {
        'sign': '$sign',
        'password': '$password',
        'languageId': '$languageId'
      });

      RegisterModel registerModel = RegisterModel.fromMap(data['data']);
      RegisterModelData registerModelData = RegisterModelData.fromMap(data);
      return registerModelData;
    } catch (e) {
      throw RegisterException(message: 'Giriş Yapılamadı');
    }
  }
}
