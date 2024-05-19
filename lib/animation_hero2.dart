import 'package:flutter/material.dart';
import 'generated/assets.dart';
import 'dart:math';

class AnimationHero2Page extends StatefulWidget {
  const AnimationHero2Page({super.key, required this.title});

  final String title;

  @override
  State<AnimationHero2Page> createState() => _AnimationHero2PageState();
}

class _AnimationHero2PageState extends State<AnimationHero2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: RadialExpansion(
          maxRadius: 100,
          child: PhotoHero(
            photo: Assets.imagesMap3,
            width: 200,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      title: Text(widget.title),
                    ),
                    body: Container(
                      color: Colors.lightBlueAccent,
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.topLeft,
                      child: PhotoHero(
                        photo: Assets.imagesMap3,
                        width: 500,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback? onTap;
  final double width;
  final Color? color;

  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    required this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          photo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;

  final double clipRectSize;

  final Widget child;

  const RadialExpansion(
      {super.key, required this.maxRadius, required this.child})
      : clipRectSize = 2.0 * (maxRadius / sqrt2);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipOval(
            child: child,
          ),
        ),
      ),
    );
  }
}
