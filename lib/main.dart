import 'package:flutter/material.dart';
import 'package:stopwatch/pages/stopwatch.dart';

void main() {
  runApp(const MyStopwatch());
}

class MyStopwatch extends StatelessWidget {
  const MyStopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StopWatch(),
    );
  }
}
