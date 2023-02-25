// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Profile',
      json,
      ($checkedConvert) {
        final val = Profile(
          profileIntro: $checkedConvert('profile_intro', (v) => v as String),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          linkedIn: $checkedConvert('linked_in', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          image: $checkedConvert('image', (v) => v as String),
          experience: $checkedConvert(
              'experience',
              (v) => (v as List<dynamic>)
                  .map((e) => Experience.fromJson(e as Map<String, dynamic>))
                  .toList()),
          skills: $checkedConvert('skills',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          education: $checkedConvert(
              'education',
              (v) => (v as List<dynamic>)
                  .map((e) => Education.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'profileIntro': 'profile_intro',
        'phoneNumber': 'phone_number',
        'linkedIn': 'linked_in'
      },
    );
