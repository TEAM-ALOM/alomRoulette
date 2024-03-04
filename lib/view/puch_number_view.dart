import 'dart:async';
import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_symbols_icons/symbols.dart';

class MoneyPanelWidget extends StatefulWidget {
  const MoneyPanelWidget({super.key});

  @override
  State<MoneyPanelWidget> createState() => _MoneyPanelWidgetState();
}

class _MoneyPanelWidgetState extends State<MoneyPanelWidget> {
  late ConfettiController _controllerCenter;
  int moneyState = 0;
  int _seconds = 0;
  bool _isRunning = false;
  Duration _duration = const Duration(milliseconds: 1000);
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    super.dispose();
    // _timer.cancel();
    _controllerCenter.dispose();
  }

  void _startTimer() {
    _duration = const Duration(microseconds: 100);
    _controllerCenter.stop();
    _isRunning = true;
    _seconds = 0;
    _timer = Timer.periodic(const Duration(microseconds: 3000), (timer) {
      setState(() {
        _seconds = Random().nextInt(1000);
        // _seconds += 111;
        if (_seconds >= 1000) {
          _seconds = 0;
        }
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _duration = const Duration(milliseconds: 500);
    _seconds = Random().nextInt(1000);
    _controllerCenter.play();

    _timer.cancel();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.translate(
          offset: const Offset(0, -100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, 100),
                child: const Image(
                  image: AssetImage("assets/images/alome.png"),
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Transform.translate(
                offset: const Offset(0, 150),
                child: ConfettiWidget(
                  maxBlastForce: 31,
                  minBlastForce: 30,
                  emissionFrequency: 0, // how often it should emit
                  numberOfParticles: 1500, // number of particles to emit
                  gravity: 0.05, // grav
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality.explosive,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ],
                  createParticlePath: drawStar,
                ),
              ),
              AnimatedFlipCounter(
                duration: _duration,
                wholeDigits: 3,
                value: _seconds,
                textStyle: const TextStyle(
                  fontSize: 300,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Row(
              //   children: [
              //     AnimatedFlipCounter(
              //       curve: Curves.ease,
              //       duration: const Duration(milliseconds: 400),
              //       value: _seconds ~/ 100, // pass in a value like 2014
              //       textStyle: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 180,
              //       ),
              //     ),
              //     AnimatedFlipCounter(
              //       duration: const Duration(milliseconds: 600),
              //       value: (_seconds ~/ 10) % 10, // pass in a value like 2014
              //       textStyle: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 180,
              //       ),
              //     ),
              //     AnimatedFlipCounter(
              //       duration: const Duration(milliseconds: 1000),
              //       value: _seconds % 10, // pass in a value like 2014
              //       textStyle: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 180,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 16),
              Text(
                _isRunning ? "버튼을 눌러 멈춰주세요" : "버튼을 눌러 숫자를 뽑아주세요",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _isRunning ? _stopTimer : _startTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const FaIcon(
                      Symbols.casino,
                      size: 100,
                    ),
                    // label: _isRunning ? const Text('멈춰!') : const Text(''),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
