import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/controllers/home_controller.dart';
import 'package:paintball_app/utils/firebase_authentication.dart';
import 'package:paintball_app/widgets/home_tournaments_card.dart';
import 'package:paintball_app/widgets/loading_typewriter.dart';
import 'package:paintball_app/widgets/outline_text_widget.dart';

import '../widgets/home_news_card.dart';
import '../widgets/left_text_menu_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      endDrawer: const CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF010101), Color(0xFF303030)])),
        child: SafeArea(
          child: Obx(
            () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: _controller.isFinishLoad.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(context),
                          buildDiscover(),
                          Row(
                            children: [
                              buildLeftTextMenu(),
                              Obx(
                                () => buildHomeCardView(),
                              ),
                            ],
                          ),
                          buildHomeBottomNavigation(),
                          const SizedBox(height: 10),
                        ],
                      )
                    : const LoadingTypeWriter()),
          ),
        ),
      ),
    );
  }

  Widget buildHomeBottomNavigation() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () => _controller.onMenuIndexPressed(0),
                child: Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(10),
                  decoration: _controller.menuIndex.value == 0
                      ? BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/ic_home3x.png',
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () => _controller.onMenuIndexPressed(1),
                child: Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(10),
                  decoration: _controller.menuIndex.value == 1
                      ? BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(15),
                        )
                      : null,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/ic_news3x.png',
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () => _controller.onMenuIndexPressed(2),
                child: Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(10),
                  decoration: _controller.menuIndex.value == 2
                      ? BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/ic_ranking3x.png',
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () => _controller.onMenuIndexPressed(3),
                child: Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(10),
                  decoration: _controller.menuIndex.value == 3
                      ? BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/ic_trophy3x.png',
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () => _controller.onMenuIndexPressed(4),
                child: Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(10),
                  decoration: _controller.menuIndex.value == 4
                      ? BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/icons/ic_profile3x.png',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHomeCardView() {
    return _controller.sideMenuIndex.value == 0
        ? Expanded(
            flex: 7,
            child: _controller.newsList.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        ..._controller.newsList.map(
                          (news) => HomeNewsCard(news: news),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text(
                      'No News Available',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
          )
        : _controller.sideMenuIndex.value == 1
            ? Expanded(
                flex: 7,
                child: _controller.tournamentsList.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            ..._controller.tournamentsList.map(
                              (tournaments) => HomeTournamentsCard(
                                tournaments: tournaments,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text(
                          'No Tournaments Available',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
              )
            : Expanded(
                flex: 7,
                child: _controller.newsList.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            ..._controller.newsList.map(
                              (news) => HomeNewsCard(news: news),
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text(
                          'No News Available',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
              );
  }

  Widget buildLeftTextMenu() {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 450,
        child: RotatedBox(
          quarterTurns: 3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => InkWell(
                  onTap: () => _controller.onSideMenuIndexPressed(2),
                  child: LeftTextMenu(
                    title: 'MarketPlace',
                    isSelected: _controller.sideMenuIndex.value == 2,
                  ),
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: () => _controller.onSideMenuIndexPressed(1),
                  child: LeftTextMenu(
                    title: 'Tournaments',
                    isSelected: _controller.sideMenuIndex.value == 1,
                  ),
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: () => _controller.onSideMenuIndexPressed(0),
                  child: LeftTextMenu(
                    title: 'News',
                    isSelected: _controller.sideMenuIndex.value == 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDiscover() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 25,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const OutlineTextWidget(
                  text: 'DISCOVER', fontSize: 25, color: yellow),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  color: yellow,
                ),
              ),
            ],
          ),
          const Divider(color: yellow)
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            child: Image.asset(
              'assets/icons/ic_profile_placeholder2x.png',
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 56,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: GoogleFonts.dmSans(
                      color: yellow,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    _controller.userProfile?.displayName ??
                        _controller.userProfile?.email ??
                        'New User',
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset('assets/icons/ic_rect_menu2x.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 30,
                      height: 38,
                      child: Image.asset('assets/logo/app_logo3x.png')),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          Image.asset('assets/icons/ic_rect_menu_close3x.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'HOME',
                  style: GoogleFonts.russoOne(fontSize: 25, color: yellow),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'NEWS',
                  style: GoogleFonts.russoOne(fontSize: 25, color: yellow),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'TOURNAMENTS',
                  style: GoogleFonts.russoOne(fontSize: 25, color: yellow),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'MARKETPLACE',
                  style: GoogleFonts.russoOne(fontSize: 25, color: yellow),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'PLAYER SIGN UP',
                  style: GoogleFonts.russoOne(fontSize: 25, color: yellow),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const OutlineTextWidget(
                    text: 'CREATE A TEAM', fontSize: 25, color: yellow),
              ),
              TextButton(
                onPressed: () => FirebaseAuthentication.signOut(),
                child: const OutlineTextWidget(
                    text: 'SIGN OUT', fontSize: 16, color: yellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
