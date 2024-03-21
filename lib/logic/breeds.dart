class Breeds {
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final String lifeSpan;
  final int intelligence;
  final String? wikipedia;

  Breeds(
      {required this.id,
      required this.name,
      required this.temperament,
      required this.origin,
      required this.description,
      required this.lifeSpan,
      required this.intelligence,
      required this.wikipedia});

  factory Breeds.fromJson(Map<String, dynamic> json) {
    return Breeds(
      id: json['id'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      lifeSpan: json['life_span'] as String,
      intelligence: json['intelligence'] as int,
      wikipedia: json['wikipedia_url'] as String?,
    );
  }
}
