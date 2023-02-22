import 'dart:convert';

import 'package:cubbit_egitim/core/consts/apiconst.dart';
import 'package:cubbit_egitim/core/services/api_service.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServiceImpl implements ApiService {
  //di gerekecek.

  final Dio _dio = instance<Dio>();

  @override
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParameters) async {
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final Response response = await _dio.post(url,
        data: jsonEncode(queryParameters),
        options: Options(headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }));

    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception(
          "Status Code : ${response.statusCode} Status Message : ${response.statusMessage!}");
    }
  }
}
