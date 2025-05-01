import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CustomHeroHome());
  }
}

class CustomHeroHome extends StatelessWidget {
  const CustomHeroHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Tween Hero")),
      body: Center(
        child: GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CustomHeroDetail()),
              ),
          child: Hero(
            tag: 'custom',
            createRectTween: (begin, end) {
              // Use the correct RectTween type
              return MaterialRectArcTween(begin: begin, end: end);
            },
            child: Image.asset('assets/pic1.png', width: 150),
          ),
        ),
      ),
    );
  }
}

class CustomHeroDetail extends StatelessWidget {
  const CustomHeroDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: 'custom',
            createRectTween: (begin, end) {
              return MaterialRectArcTween(begin: begin, end: end);
            },
            child: Image.asset('assets/pic1.png', width: 300),
          ),
        ),
      ),
    );
  }
}
