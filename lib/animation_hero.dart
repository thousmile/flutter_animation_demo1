import 'package:flutter/material.dart';

import 'generated/assets.dart';

class AnimationHeroPage extends StatefulWidget {
  const AnimationHeroPage({super.key, required this.title});

  final String title;

  @override
  State<AnimationHeroPage> createState() => _AnimationHeroPageState();
}

class _AnimationHeroPageState extends State<AnimationHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
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
    );
  }
}

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback? onTap;
  final double width;

  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
