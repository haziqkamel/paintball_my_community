import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:paintball_app/models/news_model.dart';
import 'package:paintball_app/models/tournaments_model.dart';
import 'package:paintball_app/repositories/user_repo.dart';
import 'package:paintball_app/utils/firebase_authentication.dart';

class HomeController extends GetxController {
  RxInt menuIndex = 0.obs;
  RxInt sideMenuIndex = 0.obs;
  RxBool isFinishLoad = false.obs;
  List<News> newsList = [];
  List<Tournaments> tournamentsList = [];

  onMenuIndexPressed(int index) {
    menuIndex.value = index;
  }

  onSideMenuIndexPressed(int index) {
    sideMenuIndex.value = index;
  }

  User? get userProfile => FirebaseAuthentication.firebaseUser;

  @override
  void onInit() async {
    await setUserProfile();
    await setDashBoard();
    super.onInit();
  }

  Future<void> setUserProfile() async {
    await UserRepo().setDisplayName(userProfile?.displayName ?? '');
    await UserRepo().setUserEmail(userProfile?.email ?? '');
    await UserRepo().setEmailVerified(userProfile?.emailVerified ?? false);
    await UserRepo().setUserPhotoUrl(userProfile?.photoURL ?? '');
    await UserRepo().setUserId(userProfile?.uid ?? '');
  }

  Future<void> setDashBoard() async {
    newsList.clear();
    tournamentsList.clear();
    isFinishLoad.value = false;

    await getNewsData().then((value) {
      for (var e in value.docs) {
        newsList.add(
          News(
            id: e.id,
            newsTitle: e['title'],
            newsHeadImage: e['headImage'],
            newsDescription: e['description'],
            authorImageUrl: e['authorImage'],
            authorName: e['authorName'],
            newsPostedOn: e['postedOn'],
            newsMoreDescription: e['moreDescription'],
            shareUrl: e['shareUrl'],
            type: e['type'],
          ),
        );
      }
    });

    await getTournamentsData().then((value) => {
          for (var e in value.docs)
            {
              tournamentsList.add(
                Tournaments(
                  type: e['type'],
                  id: e.id,
                  title: e['title'],
                  subTitle: e['subTitle'],
                  eventDate: e['eventDate'],
                  eventLocation: e['eventLocation'],
                  headImage: e['headImage'],
                ),
              ),
            }
        });

    isFinishLoad.value = true;
  }

  Future<QuerySnapshot> getNewsData() async {
    return await FirebaseFirestore.instance.collection('news').get();
  }

  Future<QuerySnapshot> getTournamentsData() async {
    return await FirebaseFirestore.instance.collection('tournaments').get();
  }
}
