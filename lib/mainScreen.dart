import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sedong_mbti/const/sizes.dart';
import 'package:sedong_mbti/mbtiScreen/Screen2.dart';
import 'package:sedong_mbti/view/roulette.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const Placeholder(),
    const RouletteScreen(),
    const Screen2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: false,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 100,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Symbols.stadia_controller_sharp,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Symbols.stadia_controller_sharp,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: FaIcon(
                    FontAwesomeIcons.bookOpen,
                    color: Colors.grey,
                  ),
                  activeItem: FaIcon(
                    FontAwesomeIcons.bookOpen,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 4',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                // log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
      // appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
    );
  }

  TextStyle Text_style(BuildContext context) {
    return TextStyle(
      shadows: const [
        Shadow(
          color: Colors.grey,
          offset: Offset(3.0, 3.0),
          blurRadius: Sizes.size3,
        )
      ],
      fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor,
      fontSize: Sizes.size16 + Sizes.size14,
    );
  }
}
