import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AnimatedLogoPage extends StatefulWidget {
  final String title;

  const AnimatedLogoPage({super.key, required this.title});

  @override
  State<AnimatedLogoPage> createState() => _AnimatedLogoPageState();
}

class _AnimatedLogoPageState extends State<AnimatedLogoPage>
    with SingleTickerProviderStateMixin {
  final _logger = Logger();

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) {
        _logger.i('$status');
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedLogo(title: widget.title, animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// #docregion AnimatedLogo
class AnimatedLogo extends AnimatedWidget {
  final String title;

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
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: animation.value,
          width: animation.value,
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
// #enddocregion AnimatedLogo
