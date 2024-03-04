import 'package:flutter/material.dart';
import 'package:sedong_mbti/const/sizes.dart';

class Questions extends StatefulWidget {
  final String question;

  const Questions({
    super.key,
    required this.question,
  });

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          widget.question,
          style: const TextStyle(
            fontSize: Sizes.size28,
          ),
        ),
      ),
    );
  }
}
