import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sedong_mbti/const/sizes.dart';
import 'package:sedong_mbti/mbtiScreen/Screen2.dart';
import 'package:sedong_mbti/mbtiScreen/mbti_Button/QustionButton.dart';

import 'package:sedong_mbti/mbtiScreen/mbti_Button/QustionsAnswer.dart';

String answer1 = '11';
String answer2 = '22';

class MbtiScreen extends StatefulWidget {
  const MbtiScreen({
    super.key,
  });
  @override
  State<MbtiScreen> createState() => _MbtiScreenState();
}

class _MbtiScreenState extends State<MbtiScreen>
    with SingleTickerProviderStateMixin {
  double a = 0;
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/mbtiBG.jpeg'),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '개발하실?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size28,
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.size52,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const Screen2(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size11,
                          horizontal: Sizes.size16,
                        ),
                        child: Text(
                          answer1,
                          style: const TextStyle(
                            fontSize: Sizes.size28,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.size52,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen2(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size11,
                          horizontal: Sizes.size16,
                        ),
                        child: Text(
                          answer2,
                          style: const TextStyle(
                            fontSize: Sizes.size28,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.size72,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Colors.grey,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Text('이전 질문'),
                        ),
                      ),
                      const SizedBox(
                        width: Sizes.size28,
                      ),
                      Container(
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            ResetState();
                            print(answer1);
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            child: Transform.translate(
                              offset: const Offset(3.5, 0),
                              child: const Text(' 첫 화면'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

ResetState() {
  answer1 = 'asdf';
  answer2 = 'qwer';
}
