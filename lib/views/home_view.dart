import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/controllers/home_controller.dart';
import 'package:paintball_app/repositories/news_repo.dart';
import 'package:paintball_app/widgets/outline_text_widget.dart';

import '../widgets/home_card_news.dart';
import '../widgets/left_text_menu_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF010101), Color(0xFF303030)])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              buildDiscover(),
              Row(
                children: [
                  buildLeftTextMenu(),
                  Obx(() => buildHomeCardView()),
                ],
              ),
              buildHomeBottomNavigation(),
              const SizedBox(height: 10),
            ],
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Row(
                children: [
                  ...NewsRepository().newsRepo.map(
                        (news) => HomeCardNewsWidget(news: news),
                      ),
                ],
              ),
            ),
          )
        : _controller.sideMenuIndex.value == 1
            ? Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Row(
                    children: [
                      ...NewsRepository().newsRepo.map(
                            (news) => HomeCardNewsWidget(news: news),
                          ),
                    ],
                  ),
                ),
              )
            : Expanded(flex: 7, child: Container());
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

  Widget buildHeader() {
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
              fit: BoxFit.fill,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('assets/icons/ic_rect_menu2x.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
