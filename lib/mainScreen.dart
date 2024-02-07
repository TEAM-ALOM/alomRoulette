import 'package:flutter/material.dart';
import 'package:sedong_mbti/const/sizes.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        // backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Sizes.size14 + Sizes.size16,
            ),
            Container(
              child: Text(
                '잠깐! 인스타 팔로우 하셨나요?',
                style: Text_style(context),
              ),
            ),
            SizedBox(
              height: Sizes.size14 + Sizes.size16,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle Text_style(BuildContext context) {
    return TextStyle(
      shadows: [
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
