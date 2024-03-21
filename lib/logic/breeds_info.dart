import 'package:cat_breeds/logic/breeds.dart';

class BreedsInfo {
  final List<Breeds> list;
  final String url;
  bool isFavorite;

  BreedsInfo({
    this.isFavorite = false,
    required this.list,
    required this.url,
  });

  factory BreedsInfo.fromJson(Map<String, dynamic> json) {
    return BreedsInfo(
      url: json['url'] as String,
      list: List<Breeds>.from(
        json['breeds'].map(
          (e) => Breeds.fromJson(e),
        ),
      ),
    );
  }
}
