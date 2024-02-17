import 'package:flutter/material.dart';
import 'package:sedong_mbti/const/sizes.dart';

class options extends StatelessWidget {
  const options({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Transform.translate(
              offset: Offset(3.5, 0),
              child: Text(' 첫 화면'),
            ),
          ),
        )
      ],
    );
  }
}
