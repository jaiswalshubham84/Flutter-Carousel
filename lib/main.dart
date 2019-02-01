import 'package:carosel/component/example.dart';
import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: CarouselDemoExample(),
    );
  }
}
