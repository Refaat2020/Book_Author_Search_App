import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioConfigOptions {
  Future<BaseOptions> getBaseOption() async {
    return BaseOptions(
      baseUrl: dotenv.env['API_BASE_URL']!,
      connectTimeout: const Duration(milliseconds: 80000),
      receiveTimeout: const Duration(milliseconds: 80000),
      followRedirects: false,
      validateStatus: (status) {
        return status! <= 500;
      },
      headers: {
        'Content-type': 'application/json',
        "accept": "application/json",
      },
    );
  }
}
