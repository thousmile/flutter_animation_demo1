import 'package:flutter/material.dart';

class Animation1Page extends StatefulWidget {
  const Animation1Page({super.key, required this.title});

  final String title;

  @override
  State<Animation1Page> createState() => _Animation1PageState();
}

class _Animation1PageState extends State<Animation1Page>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
