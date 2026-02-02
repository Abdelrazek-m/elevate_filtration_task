import 'dart:developer';
import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  final String baseUrl = 'https://fakestoreapi.com/';

  Future<dynamic> get({
    required String endPoint,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await dio.request('$baseUrl$endPoint',
          options: Options(
            method: 'Get',
            headers: headers,
          ),
          );
      if (response.statusCode == 400) {
        return 'Error 400';
      }
      if (response.statusCode == 200) {
        return response.data;
      } else {
        log("${response.statusMessage}");
      }
    } catch (e) {
      return e.toString();
    }
  }

}
