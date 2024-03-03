import 'dart:async';
import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
    _isRunning = true;
    _seconds = 0;
    _timer = Timer.periodic(const Duration(microseconds: 3000), (timer) {
      setState(() {
        // _seconds = Random().nextInt(1000);
        _seconds += 111;
        if (_seconds >= 1000) {
          _seconds = 0;
        }
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _controllerCenter.play();

    setState(() {
      // _seconds = Random().nextInt(1000);
    });

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                AnimatedFlipCounter(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 400),
                  value: _seconds ~/ 100, // pass in a value like 2014
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 180,
                  ),
                ),
                AnimatedFlipCounter(
                  duration: const Duration(milliseconds: 600),
                  value: (_seconds ~/ 10) % 10, // pass in a value like 2014
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 180,
                  ),
                ),
                AnimatedFlipCounter(
                  duration: const Duration(milliseconds: 1000),
                  value: _seconds % 10, // pass in a value like 2014
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 180,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ConfettiWidget(
              emissionFrequency: 0, // how often it should emit
              numberOfParticles: 200, // number of particles to emit
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isRunning ? _stopTimer : _startTimer,
                  style: const ButtonStyle(
                    textStyle: MaterialStatePropertyAll(
                      TextStyle(fontSize: 100),
                    ),
                  ),
                  child: _isRunning ? const Text('Stop') : const Text('Start'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
