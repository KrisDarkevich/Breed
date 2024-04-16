import 'package:cat_breeds/logic/api_call.dart';
import 'package:cat_breeds/logic/api_list.dart';
import 'package:cat_breeds/logic/my_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );
  final api = ApiClient(client);
  runApp(
    Provider<ApiList>.value(
      value: ApiList(api),
      child: const MyApp(),
    ),
  );
}
