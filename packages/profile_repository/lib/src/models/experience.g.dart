// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experience _$ExperienceFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Experience',
      json,
      ($checkedConvert) {
        final val = Experience(
          companyName: $checkedConvert('company_name', (v) => v as String),
          position: $checkedConvert('position', (v) => v as String),
          startEnd: $checkedConvert('start_end', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'companyName': 'company_name',
        'startEnd': 'start_end'
      },
    );
