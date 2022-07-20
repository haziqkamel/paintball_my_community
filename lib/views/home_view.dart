import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintball_app/constants/color.dart';
import 'package:paintball_app/controllers/home_controller.dart';
import 'package:paintball_app/widgets/outline_text_widget.dart';

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
                  buildHomeCardView(),
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
                          borderRadius: BorderRadius.circular(12),
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
    return Expanded(
      flex: 7,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 450,
                width: 450,
                child: Image.asset(
                  'assets/samples/sample_image1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 450,
                width: 450,
                child: Image.asset(
                  'assets/samples/sample_image2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 450,
                width: 450,
                child: Image.asset(
                  'assets/samples/sample_image3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 450,
                width: 450,
                child: Image.asset(
                  'assets/samples/sample_image4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 450,
                width: 450,
                child: Image.asset(
                  'assets/samples/sample_image5.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 450,
                width: 450,
                child: Image.asset(
                  'assets/samples/sample_image6.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
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
                  onTap: () => _controller.onSideMenuIndexPressed(0),
                  child: LeftTextMenu(
                    title: 'MarketPlace',
                    isSelected: _controller.sideMenuIndex.value == 0,
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
                  onTap: () => _controller.onSideMenuIndexPressed(2),
                  child: LeftTextMenu(
                    title: 'News',
                    isSelected: _controller.sideMenuIndex.value == 2,
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
          SizedBox(
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
                  'User_123',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('assets/icons/ic_rect_menu2x.png')),
          ),
        ],
      ),
    );
  }
}
