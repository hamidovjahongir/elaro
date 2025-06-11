  import 'package:dio/dio.dart';
  import 'dart:developer';

  class  DioClient {
    Dio dioClient = Dio(
        BaseOptions(
          baseUrl: "https://api.elaro.uz/api",
          receiveTimeout: Duration(minutes: 1),
          connectTimeout: Duration(minutes: 1),
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            log("METHOD TYPE: ${options.method}");
            log("METHOD TYPE: ${options.path}");
            log("REQUEST BODY: ${options.data}");
            return handler.next(options);
          },

          onResponse: (response, handler) {
            log("RESPONSE STATUS CODE: ${response.statusCode}");
            log("RESPONSE DATA: ${response.data}");
            return handler.next(response);
          },
          onError: (e, handler) {
            log("On Error: $e");
            return handler.next(e);
          },
        ),
      );
  }
