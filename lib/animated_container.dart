import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AnimatedContainerPage extends StatefulWidget {
  final String title;

  const AnimatedContainerPage({super.key, required this.title});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage>
    with SingleTickerProviderStateMixin {
  final _logger = Logger();

  double _width = 50;

  double _height = 50;

  Curve _curve = Curves.fastOutSlowIn;

  final List<Curve> _curves = [
    Curves.fastOutSlowIn,
    Curves.easeInOutExpo,
    Curves.bounceIn,
    Curves.easeInBack,
    Curves.easeOutQuint,
  ];

  Color _color = Colors.green;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _onPressed() {
    setState(() {
      _curve = _curves[_randomInt(0, 4)];
      _width = _randomDouble(10, 300);
      _height = _randomDouble(10, 300);
      _color = Color.fromRGBO(
        _randomInt(0, 256),
        _randomInt(0, 256),
        _randomInt(0, 256),
        _randomDouble(0.1, 1.0),
      );
      _logger.i("width: $_width height: $_height curve: $_curve Color: $_color");
      _borderRadius = BorderRadius.circular(_randomDouble(1, 100));
    });
  }

  double _randomDouble(double min, double max) {
    // + min  表示生成一个最小数 min 到最大数之间的是数字
    var num = Random().nextDouble() * (max - min) + min;
    return num;
  }

  int _randomInt(int min, int max) {
    // + min  表示生成一个最小数 min 到最大数之间的是数字
    var num = Random().nextInt(max) + min;
    // floor() 返回的是一个整数。
    return num.floor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: const Duration(seconds: 1),
          curve: _curve,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
