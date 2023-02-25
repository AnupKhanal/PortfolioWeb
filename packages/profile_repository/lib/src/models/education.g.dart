// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Education',
      json,
      ($checkedConvert) {
        final val = Education(
          school: $checkedConvert('school', (v) => v as String),
          course: $checkedConvert('course', (v) => v as String),
          university: $checkedConvert('university', (v) => v as String),
          year: $checkedConvert('year', (v) => v as String),
        );
        return val;
      },
    );
