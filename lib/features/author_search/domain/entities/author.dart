import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String key;
  final String name;
  final List<String> alternateNames;
  final String? birthDate;
  final String? topWork;
  final int workCount;

  const Author({
    required this.key,
    required this.name,
    this.alternateNames = const [],
    this.birthDate,
    this.topWork,
    required this.workCount,
  });

  @override
  List<Object?> get props => [
    key,
    name,
    alternateNames,
    birthDate,
    topWork,
    workCount,
  ];
}
