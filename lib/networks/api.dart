import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:paintball_app/networks/api_client.dart';

class Api {
  static ApiClient getInstance() {
    return ApiClient(_getDio());
  }

  static Dio _getDio() {
    var options = BaseOptions(
      baseUrl: '',
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    );
    var dio = Dio(options);

    if (kDebugMode) {
      dio.interceptors.add(
          LogInterceptor(requestBody: true, requestHeader: true, error: true));
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          if (options.data != null) {
            // Common.printWrapped('Request params: ' + jsonEncode(options.data));
          }
          // String userToken = await UserRepo().getUserToken();
          // log.i(userToken);
          // options.headers['TOKEN'] = userToken;
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // log.i('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          if (response.data != null && response.data is String) {
            response.data = json.decode(response.data);
          }
          return handler.next(response);
        },
        onError: (DioError e, ErrorInterceptorHandler handler) async {
          print('dioInterceptors.add: $e');
          return handler.next(e);
        },
      ),
    );
    return dio;
  }
}
