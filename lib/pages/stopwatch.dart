import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Stopwatch stopwatch;
  late Timer t;

  
  // initial stage when the app just restart/reload
  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  // function which controls the start/stop of the stopwatch
  void startStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  // function for the time which is showing inside the stopwatch
  String formattedText() {
    var m = stopwatch.elapsed.inMilliseconds;
    String miliseconds = (m % 1000).toString().padLeft(3, "0");
    String seconds = ((m ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = (((m ~/ 1000) ~/ 60) % 60).toString().padLeft(2, "0");
    return " $minutes : $seconds : $miliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  startStop();
                },
                padding: EdgeInsets.zero,
                child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 5)),
                  child: Text(
                    formattedText(),
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    stopwatch.reset();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
