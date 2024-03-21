import 'dart:io';

import 'package:cat_breeds/logic/api_call.dart';
import 'package:cat_breeds/logic/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  final client = HttpClient();
  final api = ApiClient(client);
  final response = await api.getUrl();
  runApp(
    MyApp(
      breedsInfo: response,
    ),
  );
}
