import 'package:flutter/material.dart';
import 'package:sedong_mbti/const/sizes.dart';
import 'package:sedong_mbti/mbtiScreen/devel_mbti.dart';

class Screen2 extends StatefulWidget {
  const Screen2({
    super.key,
    // ignore: non_constant_identifier_names
  });

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
              GestureDetector(
                onTap: () {
                  print(LanguegeC);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const SizedBox(
                    height: 300,
                    child: Image(
                      image:
                          AssetImage("assets/images/adobe-express-qr-code.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              LanguegeC == true
                  ? LocalColumn2('C언어부터 차근차근 시작해보는 것은 어떨까요?')
                  : const SizedBox(
                      height: 0,
                    ),
              Design == true
                  ? LocalColumn1('UI와 UX를 직접 구현해보고 싶으신 당신!', '디자인 팀을 추천드립니다!')
                  : const SizedBox(
                      height: 0,
                    )
            ],
          ),
        ],
      ),
    );
  }

  Column LocalColumn1(String asdf, String qwer) {
    return Column(
      children: [
        Text(
          asdf,
          style: const TextStyle(
            fontSize: Sizes.size16,
            color: Colors.white,
          ),
        ),
        Text(
          qwer,
          style: const TextStyle(
            fontSize: Sizes.size16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Column LocalColumn2(String asdf) {
    return Column(
      children: [
        Text(
          asdf,
          style: const TextStyle(
            fontSize: Sizes.size16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
