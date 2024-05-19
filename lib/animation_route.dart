import 'package:flutter/material.dart';
import 'generated/assets.dart';
import 'dart:math';

class AnimationRoutePage extends StatefulWidget {
  const AnimationRoutePage({super.key, required this.title});

  final String title;

  @override
  State<AnimationRoutePage> createState() => _AnimationRoutePageState();
}

class _AnimationRoutePageState extends State<AnimationRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () => Navigator.of(context).push(_createRoute()),
              child: const Text("Page Route Builder"),
            )
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => _DemoPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.1);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        var curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.ease);
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}

class _DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Demo Page"),
      ),
      body: const Center(
        child: Text("Hello !!!"),
      ),
    );
  }
}
