import 'dart:async';
import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class MoneyPanelWidget extends StatefulWidget {
  const MoneyPanelWidget({super.key});

  @override
  State<MoneyPanelWidget> createState() => _MoneyPanelWidgetState();
}

class _MoneyPanelWidgetState extends State<MoneyPanelWidget> {
  int moneyState = 0;
  int _seconds = 0;
  bool _isRunning = false;
  late Timer _timer;

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(microseconds: 100), (timer) {
      setState(() {
        _seconds = Random().nextInt(1000);
        // _seconds++;
        if (_seconds == 1000) {
          _seconds = 0;
        }
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedFlipCounter(
              duration: const Duration(milliseconds: 1500),
              value: _seconds, // pass in a value like 2014
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 180,
              ),
            ),
            const SizedBox(height: 16),
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
