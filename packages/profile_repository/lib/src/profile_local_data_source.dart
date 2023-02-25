import 'dart:convert';

import 'models/models.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProfileLocalDataSource {
  Future<Profile> getProfile() async {
    String profileString = await rootBundle.loadString('assets/anup_profile.json');
    var valueMap = json.decode(profileString);
    print("value map $valueMap");
    return Profile.fromJson(valueMap);
  }
}