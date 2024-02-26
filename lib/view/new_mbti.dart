import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NewMbtiView extends StatefulWidget {
  const NewMbtiView({super.key});

  @override
  State<NewMbtiView> createState() => _NewMbtiViewState();
}

class _NewMbtiViewState extends State<NewMbtiView> {
  int calculateResult = 0;
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    // minimumSize: const Size(88, 36),
    // padding: const EdgeInsets.symmetric(horizontal: 16),
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
      "파이썬이 자바보다 편하신가요?": [99, 100]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("개발 MBTI"),
              Card(
                color: Colors.primaries[5],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        question[calculateResult].keys.first,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                if (calculateResult +
                                        question[calculateResult]
                                            .values
                                            .first[0] <
                                    10) {
                                  calculateResult +=
                                      question[calculateResult].values.first[0];
                                } else {}
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
                                        question[calculateResult]
                                            .values
                                            .first[1] <
                                    10) {
                                  calculateResult +=
                                      question[calculateResult].values.first[1];
                                } else {}
                              });
                            },
                            icon: const Icon(Icons.cancel_outlined),
                            label: const Text("아니오"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    calculateResult = 0;
                  });
                },
                icon: const Icon(Icons.refresh),
                label: const Text("reset"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
