import 'dart:math';
import 'package:carosel/component/indicator/widget/props.dart';
import 'package:carosel/service/screen_ratio.dart';
import 'package:flutter/material.dart';

class DotIndicator extends AnimatedWidget {
  Color selectedColor;
  Color unselectedColor;
  Animatable<Color> background;
  Props props;
  double wf = ScreenRatio.widthRatio;

  DotIndicator({this.props}) : super(listenable: props.controller) {
    print("csdvfgfhgj");
    props.controller.addListener(() {
      print("dsfg");
    });
    selectedColor = props.selectedColor ?? Colors.white;
    unselectedColor = props.unSelectedColor ?? Colors.transparent;
    background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: unselectedColor,
          end: selectedColor,
        ),
      ),
    ]);
  }

  transformValue(index) {
    print("controlle=> ${props.controller}");
    double value;
    if (props.controller.hasClients) {
      print("controlle=> ${props.controller?.page}");
      value = max(
        0.0,
        1.0 - ((props.controller.page ?? 0.0) - index).abs(),
      );
      print("$value => $index");
    }
    return value ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: Alignment.topLeft,
        height: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[]..addAll(List.generate(
              props.totalPage,
              (int index) => Container(
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: (((props.width * wf) / (props.totalPage))
                            .clamp(1.0, 8.0)),
                        width: (((props.width * wf) / (props.totalPage))
                            .clamp(1.0, 8.0)),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: selectedColor),
                            color: transformValue(index) > 0.1
                                ? background.evaluate(AlwaysStoppedAnimation(
                                    transformValue(index)))
                                : unselectedColor),
                      ),
                    ),
                  )).toList()),
        ));
  }
}
