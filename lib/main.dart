import 'package:flutter/material.dart';
import 'package:flutter_animation_demo1/animated_builder.dart';
import 'package:flutter_animation_demo1/animated_opacity_widget.dart';
import 'package:flutter_animation_demo1/animation_route.dart';

import 'animated_container.dart';
import 'animated_opacity.dart';
import 'animated_widget.dart';
import 'animation1.dart';
import 'animation_hero.dart';
import 'animation_hero2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (c) => const MyHomePage(),
        "/animation1": (c) =>
            const Animation1Page(title: 'Flutter Animation Demo'),
        "/animated/widget": (c) =>
            const AnimatedLogoPage(title: 'Flutter AnimatedWidget Demo'),
        "/animated/builder": (c) =>
            const AnimatedBuilderPage(title: 'Flutter AnimatedBuilder Demo'),
        "/animated/opacity": (c) => const AnimatedOpacityLogoPage(
            title: 'Flutter AnimatedWidget Opacity Demo'),
        "/animated/container": (c) => const AnimatedContainerPage(
            title: 'Flutter AnimatedContainer Demo'),
        "/animated/opacity2": (c) =>
            const AnimatedOpacityPage(title: 'Flutter AnimatedOpacity Demo'),
        "/animated/hero": (c) =>
            const AnimationHeroPage(title: 'Flutter AnimatedHero Demo'),
        "/animated/hero2": (c) =>
            const AnimationHero2Page(title: 'Flutter AnimatedHero2 Demo'),
        "/animated/route": (c) =>
            const AnimationRoutePage(title: 'Flutter AnimatedRoute Demo'),
      },
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/animation1"),
                  child: const Text("animation1"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/animated/widget"),
                  child: const Text("AnimatedWidget"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/animated/builder"),
                  child: const Text("AnimatedBuilder"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/animated/opacity"),
                  child: const Text("AnimatedOpacity"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/animated/opacity2"),
                  child: const Text("AnimatedOpacity"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/animated/hero"),
                  child: const Text("AnimatedHero"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/animated/hero2"),
                  child: const Text("AnimatedHero2"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/animated/route"),
                  child: const Text("AnimatedRoute"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
