import '../../domain/entities/author.dart';

class AuthorModel extends Author {
  const AuthorModel({
    required super.key,
    required super.name,
    super.alternateNames,
    super.birthDate,
    super.topWork,
    required super.workCount,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      key: json['key'] ?? '',
      name: json['name'] ?? 'Unknown Author',
      alternateNames: json['alternate_names'] != null
          ? List<String>.from(json['alternate_names'])
          : [],
      birthDate: json['birth_date'],
      topWork: json['top_work'],
      workCount: json['work_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'alternate_names': alternateNames,
      'birth_date': birthDate,
      'top_work': topWork,
      'work_count': workCount,
    };
  }
}
