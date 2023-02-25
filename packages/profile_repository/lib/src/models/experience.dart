import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

@JsonSerializable()
class Experience {
  const Experience(
      {required this.companyName,
      required this.position,
      required this.startEnd,
      required this.description});

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  final String companyName;
  final String position;
  final String startEnd;
  final String description;
}
