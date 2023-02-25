import 'dart:async';

enum ProfileStatus { loading, loaded }

class ProfileRepository {
  Stream<ProfileStatus> get status async* {
    yield ProfileStatus.loading;
  }
}