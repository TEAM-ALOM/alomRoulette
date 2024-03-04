import 'package:flutter/material.dart';
import 'package:sedong_mbti/const/sizes.dart';
import 'package:sedong_mbti/view/mbti_legacy/mbti_screen.dart';

class MbtiResultScreen extends StatefulWidget {
  const MbtiResultScreen({super.key});

  @override
  State<MbtiResultScreen> createState() => _MbtiResultScreenState();
}

class _MbtiResultScreenState extends State<MbtiResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: const SizedBox(
                  height: 300,
                  child: Image(
                    image:
                        AssetImage("assets/images/adobe-express-qr-code.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              LanguegeC == true
                  ? twoLinedLocalColumn('C언어부터 차근차근 시작해보는 것은 어떨까요?')
                  : const SizedBox(
                      height: 0,
                    ),
              Design == true
                  ? oneLinedLocalColumn(
                      'UI와 UX를 직접 구현해보고 싶으신 당신!', '그런 당신에게 디자인 팀을 추천드립니다!')
                  : const SizedBox(
                      height: 0,
                    ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => {},
                icon: const Icon(Icons.refresh_sharp),
                label: const Text("다시하기"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column oneLinedLocalColumn(String firstString, String secondString) {
    return Column(
      children: [
        Text(
          firstString,
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          secondString,
          style: const TextStyle(
            fontSize: Sizes.size16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Column twoLinedLocalColumn(String firstString) {
    return Column(
      children: [
        Text(
          firstString,
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
