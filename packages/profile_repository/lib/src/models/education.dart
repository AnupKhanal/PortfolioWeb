import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

@JsonSerializable()
class Education {
  const Education({
   required this.school,
   required this.course,
   required this.university,
   required this.year
});

  factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);

  final String school;
  final String course;
  final String university;
  final String year;
}