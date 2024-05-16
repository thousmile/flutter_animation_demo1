import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AnimatedBuilderPage extends StatefulWidget {
  final String title;

  const AnimatedBuilderPage({super.key, required this.title});

  @override
  State<AnimatedBuilderPage> createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
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
  Widget build(BuildContext context) {
    return GrowTransition(
      title: widget.title,
      animation: animation,
      child: const LogoWidget(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends AnimatedWidget {
  final String title;

  final Widget child;

  final Animation<double> animation;

  const GrowTransition({
    super.key,
    required this.child,
    required this.animation,
    required this.title,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SizedBox(
              width: animation.value,
              height: animation.value,
              child: const LogoWidget(),
            );
          },
          child: child,
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 3.0),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}
