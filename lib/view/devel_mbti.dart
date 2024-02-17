import 'package:flutter/material.dart';
import 'package:sedong_mbti/const/sizes.dart';
import 'package:sedong_mbti/view/mbti_Button/QustionButton.dart';
import 'package:sedong_mbti/view/mbti_Button/option.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2 * 3.141,
    ).animate(_controller);

    _controller.repeat();
    a = 0;
  }

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
              //F12를 눌러 두칸의 질문에 대한 답변을 작성하시오.
              //qus에는 질문을 넣으면 됨.
              QustionsAnwser(
                qus: '개발하실??',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class QustionsAnwser extends StatelessWidget {
  String qus;
  QustionsAnwser({
    super.key,
    required this.qus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          qus,
          style: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size28,
          ),
        ),
        const SizedBox(
          height: Sizes.size52,
        ),
        Questions(
          text__: 'asdfasdfsadf',
        ),
        const SizedBox(
          height: Sizes.size52,
        ),
        Questions(
          text__: 'ㄴㄴㄴㄴㄴㄴㄴ',
        ),
        const SizedBox(
          height: Sizes.size72,
        ),
        options(),
      ],
    );
  }
}



// ignore: must_be_immutable
