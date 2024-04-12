import 'dart:convert';
// import 'dart:io';
import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

class ApiClient {
  final Dio client;

  ApiClient(this.client);

  Future<List<BreedsInfo>> getUrl() async {
    final response = await client.get(
        'https://api.thecatapi.com/v1/images/search?has_breeds=1&limit=10');

    final json = jsonDecode(jsonEncode(response.data)) as List<dynamic>;
    final info = json
        .map(
          (e) => BreedsInfo.fromJson(e),
        )
        .toList();

    return info;
  }
}

// class ApiClient {
//   final HttpClient client;

//   ApiClient(this.client);

//   Future<List<BreedsInfo>> getUrl() async {
//     final response = await http.get(
//       Uri.parse(
//           'https://api.thecatapi.com/v1/images/search?has_breeds=1&limit=10'),
//       headers: {
//         'x-api-key':
//             'live_tD6kGXnUrhQYrAZboJRpbjXFN2dKAS6nM43XP1tJSGe1ajRRHuTs1ENDqdEpaQgO',
//       },
//     );

//     final json = jsonDecode(response.body) as List<dynamic>;
//     final info = json
//         .map(
//           (e) => BreedsInfo.fromJson(e),
//         )
//         .toList();
//     return info;
//   }
// }
