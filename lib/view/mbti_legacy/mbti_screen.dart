import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:sedong_mbti/const/sizes.dart';
import 'package:sedong_mbti/view/mbti_legacy/question_string/question.dart';
import 'package:sedong_mbti/view/mbti_legacy/question_string/question_answer.dart';

int FirstIdx = 0, secIdx = 1;
int Questidx = 0, Ans1Idx = 0, Ans2Idx = 1;
String answer1 = qusestionAnswerString[FirstIdx];
String answer2 = qusestionAnswerString[secIdx];
String __QusetMent = questionString[Questidx];
bool access = true;
bool Design = true;
bool LanguegeC = false;
bool Front = false;
bool back_ = false;

class MbtiScreen extends StatefulWidget {
  const MbtiScreen({
    super.key,
  });
  @override
  State<MbtiScreen> createState() => _MbtiScreenState();
}

class _MbtiScreenState extends State<MbtiScreen> {
  NextSet() {
    if (Design == false && LanguegeC == false) {
      Questidx++;
      Ans1Idx += 2;
      Ans2Idx += 2;
    } else if (LanguegeC == true) {
    } else if (Design == true) {}
    answer1 = qusestionAnswerString[Ans1Idx];
    answer2 = qusestionAnswerString[Ans2Idx];
    __QusetMent = questionString[Questidx];
    setState(() {});
  }

  ResetState() {
    Ans1Idx = 0;
    Ans2Idx = 1;
    Questidx = 0;
    answer1 = qusestionAnswerString[FirstIdx];
    answer2 = qusestionAnswerString[secIdx];
    __QusetMent = questionString[Questidx];
    setState(() {});
  }

  BeforeState() {
    Ans1Idx >= 2 ? Ans1Idx -= 2 : Ans1Idx = 0;
    Ans2Idx >= 2 ? Ans2Idx -= 2 : Ans2Idx = 1;
    Questidx == 0 ? Questidx = 0 : Questidx -= 1;
    answer1 = qusestionAnswerString[Ans1Idx];
    answer2 = qusestionAnswerString[Ans2Idx];
    __QusetMent = questionString[Questidx];
    setState(() {});
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
                  SizedBox(
                    width: questionString[Questidx].length > 17 ? 340 : null,
                    child: Flexible(
                      child: RichText(
                        strutStyle: const StrutStyle(
                          fontSize: Sizes.size16,
                        ),
                        maxLines: 5,
                        text: TextSpan(
                          text: questionString[Questidx],
                          style: const TextStyle(
                            color: Colors.white,
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
                      if (Ans1Idx == 4) Front = true;
                      NextSet();
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
                      if (Ans2Idx == 1) {
                        Design = true;
                        setState(() {});
                      } else if (Ans2Idx == 3) {
                        LanguegeC = true;
                        setState(() {});
                      } else if (Ans2Idx == 5) {
                        back_ = true;
                        setState(() {});
                      }
                      NextSet();
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
                      GestureDetector(
                        onTap: () {
                          BeforeState();
                        },
                        child: Container(
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
                            setState(
                              () {
                                ResetState();
                              },
                            );
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

Future<void> ReverseAccess() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  access = !access;
  print(access);
}
