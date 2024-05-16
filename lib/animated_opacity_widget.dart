import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AnimatedOpacityLogoPage extends StatefulWidget {
  final String title;

  const AnimatedOpacityLogoPage({super.key, required this.title});

  @override
  State<AnimatedOpacityLogoPage> createState() =>
      _AnimatedOpacityLogoPageState();
}

class _AnimatedOpacityLogoPageState extends State<AnimatedOpacityLogoPage>
    with SingleTickerProviderStateMixin {
  final _logger = Logger();

  late Animation<double> _animation;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        _logger.i('$status');
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedLogo(title: widget.title, animation: _animation);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  final String title;

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);

  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  const AnimatedLogo({
    super.key,
    required Animation<double> animation,
    required this.title,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 3.0),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
