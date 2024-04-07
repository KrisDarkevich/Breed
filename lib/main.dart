// import 'dart:io';

import 'package:cat_breeds/logic/api_call.dart';
import 'package:cat_breeds/logic/my_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  final client = Dio(
    BaseOptions(
      headers: {
        'x-api-key':
            'live_tD6kGXnUrhQYrAZboJRpbjXFN2dKAS6nM43XP1tJSGe1ajRRHuTs1ENDqdEpaQgO',
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('ti lox2');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('ti lox');

          return handler.next(response);
        },
      ),
    );
  final api = ApiClient(client);
  final response = await api.getUrl();
  runApp(
    MyApp(
      breedsInfo: response,
    ),
  );
}
