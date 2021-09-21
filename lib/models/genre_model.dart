import 'dart:convert';

class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  // modelo para json
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // json para modelo
  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModel.fromJson(String source) =>
      GenreModel.fromMap(json.decode(source));
}
