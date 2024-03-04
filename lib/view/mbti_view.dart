import 'package:auto_size_text/auto_size_text.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';

import 'package:flutter/material.dart';

class NewMbtiView extends StatefulWidget {
  const NewMbtiView({super.key});

  @override
  State<NewMbtiView> createState() => _NewMbtiViewState();
}

class _NewMbtiViewState extends State<NewMbtiView> {
  int calculateResult = 0;
  bool toggle = true;
  bool isImageVisible = false;
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.blue,
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
  final ButtonStyle raisedButtonStyleReverse = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
  static const List<Map<String, List<int>>> question = [
    {
      "개발보단 디자인이 하고 싶으신가요?": [1, 3]
    },
    {
      "Figma 라는 툴을 다뤄본 적이 있으신가요?": [100, 1]
    },
    {
      "Illustrator 라는 툴을 다뤄본 적이 있으신가요?": [100, 101]
    },
    {
      "눈에 보이지 않는 것보단 눈에 보이는 것을 만들고 싶어요": [1, 4]
    },
    {
      "아이폰을 사용하시나요?": [1, 2]
    },
    {
      "맥북을 사용하거나 구매의향이 있으신가요?": [99, 100]
    },
    {
      "애플 기기도 동시에 개발하고 싶으신가요?": [99, 100]
    },
    {
      "파이썬이 자바보다 편하신가요?": [100, 101]
    },
  ];
  Map<int, String> answer = {
    101: "디자이너(고급반)이 어울리는 당신",
    102: "디자이너(중급반)이 어울리는 당신",
    103: "디자이너(초급반)이 어울리는 당신",
    104: "아이폰 앱 개발 어울리는 당신",
    105: "앱의 MZ, 플러터가 어울리는 당신",
    106: "안드로이드 앱개발이 어울리는 당신",
    107: "노드가 어울리는 당신",
    108: "서버계의 근본, 스프링이 어울리는 당신",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "아롬 MBTI 측정기",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedSizeAndFade(
                child: toggle
                    ? const SizedBox()
                    : Column(
                        children: [
                          Card(
                            color: Colors.primaries[5],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 100),
                              child: SizedBox(
                                width: isImageVisible ? 700 : 600,
                                height: isImageVisible ? 700 : 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedSizeAndFade(
                                      child: isImageVisible
                                          ? const Column(
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      "assets/images/adobe-express-qr-code.png"),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                )
                                              ],
                                            )
                                          : const SizedBox(),
                                    ),
                                    AutoSizeText(
                                      isImageVisible
                                          ? answer[calculateResult] ??
                                              calculateResult.toString()
                                          : question[calculateResult]
                                              .keys
                                              .first,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    SizedBox(
                                      height: isImageVisible ? 3 : 30,
                                    ),
                                    AnimatedSizeAndFade(
                                      child: isImageVisible
                                          ? const Text(
                                              "지금 당장 아롬에 지원하셔서 실력을 뽐내보세요!",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton.icon(
                                                  style: raisedButtonStyle,
                                                  onPressed: () {
                                                    setState(() {
                                                      if (calculateResult +
                                                              question[
                                                                      calculateResult]
                                                                  .values
                                                                  .first[0] <
                                                          10) {
                                                        calculateResult += question[
                                                                calculateResult]
                                                            .values
                                                            .first[0];
                                                      } else {
                                                        calculateResult += question[
                                                                calculateResult]
                                                            .values
                                                            .first[0];
                                                        isImageVisible = true;
                                                      }
                                                    });
                                                  },
                                                  icon: const Icon(Icons.check),
                                                  label: const Text("네!"),
                                                ),
                                                ElevatedButton.icon(
                                                  style: raisedButtonStyle,
                                                  onPressed: () {
                                                    setState(() {
                                                      if (calculateResult +
                                                              question[
                                                                      calculateResult]
                                                                  .values
                                                                  .first[1] <
                                                          10) {
                                                        calculateResult += question[
                                                                calculateResult]
                                                            .values
                                                            .first[1];
                                                      } else {
                                                        calculateResult += question[
                                                                calculateResult]
                                                            .values
                                                            .first[1];
                                                        isImageVisible = true;
                                                      }
                                                    });
                                                  },
                                                  icon: const Icon(
                                                      Icons.cancel_outlined),
                                                  label: const Text("아니오"),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                style: raisedButtonStyleReverse,
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                    isImageVisible = false;
                    calculateResult = 0;
                  });
                },
                icon: toggle
                    ? const Icon(Icons.check)
                    : const Icon(Icons.refresh),
                label: toggle
                    ? const Text(
                        "시작하기",
                      )
                    : const Text(
                        "다시하기",
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
