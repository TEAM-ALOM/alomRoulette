import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbspinningwheel/kbspinningwheel.dart';

class RouletteScreen extends StatefulWidget {
  const RouletteScreen({super.key});

  @override
  State<RouletteScreen> createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  final StreamController _dividerController = StreamController<int>();

  @override
  void dispose() {
    _dividerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "룰렛을 돌려보세요!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
            SpinningWheel(
              image: Image.asset('assets/images/roulette-8-300.png'),
              width: 600,
              height: 600,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.4,
              canInteractWhileSpinning: false,
              dividers: 8,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
              secondaryImage:
                  Image.asset('assets/images/roulette-center-300.png'),
              secondaryImageHeight: 110,
              secondaryImageWidth: 110,
            ),
            const SizedBox(height: 30),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
                  snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
            )
          ],
        ),
      ),
    );
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1000\$',
    2: '400\$',
    3: '800\$',
    4: '7000\$',
    5: '5000\$',
    6: '300\$',
    7: '2000\$',
    8: '100\$',
  };

  RouletteScore(this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${labels[selected]}',
      style: const TextStyle(
        fontSize: 100.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
