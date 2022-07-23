import 'package:paintball_app/utils/preference.dart';

class UserRepo {
  static const String kDisplayName = 'USER_DISPLAY_NAME';
  static const String kUserEmail = 'USER_EMAIL';
  static const String kEmailVerified = 'USER_EMAIL_VERIFIED';
  static const String kUserPhoneNumber = 'USER_PHONE_NUMBER';
  static const String kUserPhotoUrl = 'USER_PHOTO_URL';
  static const String kUid = 'USER_UID';

  Future<void> setDisplayName(String displayName) {
    return Preference.setString(kDisplayName, displayName);
  }

  Future<String> getDisplayName() async {
    return Preference.getString(kDisplayName, def: '');
  }

  Future<void> setUserEmail(String email) {
    return Preference.setString(kUserEmail, email);
  }

  Future<String> getUserEmail() async {
    return Preference.getString(kUserEmail, def: '');
  }

  Future<void> setEmailVerified(bool emailVerified) {
    return Preference.setBool(kEmailVerified, emailVerified);
  }

  Future<bool> getEmailVerified() async {
    return Preference.getBool(kEmailVerified, def: false);
  }

  Future<void> setUserPhotoUrl(String userPhotoUrl) {
    return Preference.setString(kUserPhotoUrl, userPhotoUrl);
  }

  Future<String> getUserPhotoUrl() async {
    return Preference.getString(kUserPhotoUrl, def: '');
  }

  Future<void> setUserId(String userId) {
    return Preference.setString(kUid, userId);
  }

  Future<String> getUserId() async {
    return Preference.getString(kUid, def: '');
  }
}
