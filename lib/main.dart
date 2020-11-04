import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WordCloudExample(),
    );
  }
}

class WordCloudExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[];
    for (var i = 0; i < 100; i++) {
      widgets.add(ScatterItem());
    }

    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Scaffold(
      body: Center(
        child: FittedBox(
          child: Scatter(
            fillGaps: true,
            delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
            children: widgets,
          ),
        ),
      ),
    );
  }
}

class ScatterItem extends StatelessWidget {
  final List<Color> colors = [
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.brown,
    Colors.amber,
    Colors.cyan,
    Colors.pink,
    Colors.purple,
    Colors.yellow,
    Colors.orange,
  ];

  final List<String> texts = [
    "Word Cloud",
    "Flutter",
    "Dart",
    "Widgets",
    "Programming",
    "Text",
    "API",
    "Word",
    "Random",
    "Letters",
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final TextStyle style = Theme.of(context).textTheme.bodyText2.copyWith(
          fontSize: random.nextDouble() * 50,
          color: colors[random.nextInt(10)],
        );
    return RotatedBox(
      quarterTurns: random.nextInt(2),
      child: Text(
        texts[random.nextInt(10)],
        style: style,
      ),
    );
  }
}
