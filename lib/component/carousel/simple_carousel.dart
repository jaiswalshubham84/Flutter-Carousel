import 'package:flutter/material.dart';
import 'dart:math' as math;

class SimpleCarousel extends StatelessWidget {
  Widget carouserBuilder;

  int currentPage;
  bool initial = true;
  final dynamic props;

  SimpleCarousel(
    this.props,
  ) {
    currentPage = 0;
  }

  initiate(index) {
    double value;
    if (index == currentPage && initial) value = 0.0;
    initial = false;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    print("controller in carousel => ${props.controller}");
    initial = true;
    currentPage = 0;
    carouserBuilder = new PageView.builder(
        scrollDirection: props.axis,
        controller: props.controller,
        itemCount: props.children.length,
        onPageChanged: (i) {
          currentPage = i;
        },
        itemBuilder: (context, index) => builder(index, props.controller));
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          height: props.height,
          width: props.width,
          child: props.axis == Axis.horizontal
              ? carouserBuilder
              : Container(
                  child: carouserBuilder,
                ),
        ),
      ],
    );
  }

  builder(int index, PageController controller1) {
    initial = true;
    return new AnimatedBuilder(
      animation: controller1,
      builder: (context, child) {
        double value = 1.0;
        value = initial
            ? initiate(index) ?? controller1.page - index
            : controller1.page - index;
        value = (1 - (value.abs() * .2)).clamp(0.0, 1.0);
        return new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Opacity(
              opacity: math.pow(value, 1.2),
              child: new Material(
                elevation: ((value - 0.8) * 2000).clamp(0.1, 10.0),
                child: Column(
                  children: <Widget>[
                    new Container(
                      height: (props.height) * math.pow(value, 20),
                      width: (props.width) * math.pow(value, 20),
                      child: props.children[index],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
