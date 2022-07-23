import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:paintball_app/repositories/user_repo.dart';
import 'package:paintball_app/utils/firebase_utils.dart';

class HomeController extends GetxController {
  RxInt menuIndex = 0.obs;
  RxInt sideMenuIndex = 0.obs;

  onMenuIndexPressed(int index) {
    menuIndex.value = index;
  }

  onSideMenuIndexPressed(int index) {
    sideMenuIndex.value = index;
  }

  User? get userProfile => FirebaseUtils.firebaseUser;

  @override
  void onInit() async {
    await setUserProfile();
    super.onInit();
  }

  Future<void> setUserProfile() async {
    await UserRepo().setDisplayName(userProfile?.displayName ?? '');
    await UserRepo().setUserEmail(userProfile?.email ?? '');
    await UserRepo().setEmailVerified(userProfile?.emailVerified ?? false);
    await UserRepo().setUserPhotoUrl(userProfile?.photoURL ?? '');
    await UserRepo().setUserId(userProfile?.uid ?? '');
  }
}
