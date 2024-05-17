import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AnimatedOpacityPage extends StatefulWidget {
  final String title;

  const AnimatedOpacityPage({super.key, required this.title});

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage>
    with SingleTickerProviderStateMixin {
  final _logger = Logger();

  bool _visible = true;

  Duration _duration = const Duration(milliseconds: 500);

  void _onPressed() {
    setState(() {
      _duration = Duration(milliseconds: _randomInt(500, 2000));
      _visible = !_visible;
      _logger.i("$_visible $_duration");
    });
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
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: _duration,
          curve: Curves.easeOut,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
