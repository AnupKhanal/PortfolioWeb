import 'package:profile_repository/src/models/education.dart';

import 'experience.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  const Profile(
      {required this.profileIntro,
      required this.phoneNumber,
      required this.email,
      required this.linkedIn,
      required this.name,
      required this.image,
      required this.experience,
      required this.skills,
      required this.education});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  final String profileIntro;
  final String phoneNumber;
  final String email;
  final String linkedIn;
  final String name;
  final String image;
  final List<Experience> experience;
  final List<String> skills;
  final List<Education> education;
}
