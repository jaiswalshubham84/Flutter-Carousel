import 'package:flutter/material.dart';
import 'dart:math';

class RotatingCarousel extends StatefulWidget {
  final double height;
  final double width;
  final double opacity;
  final Axis axis;

  final List<Widget> children;
  const RotatingCarousel(
      {Key key,
      this.height,
      this.width,
      this.opacity,
      this.children,
      this.axis})
      : super(key: key);

  @override
  _RotatingCarouselState createState() => new _RotatingCarouselState(
      initial: true,
      height: height,
      width: width,
      opacity: opacity,
      list: children,
      axis: axis);
}

class _RotatingCarouselState extends State<RotatingCarousel> {
  _RotatingCarouselState(
      {this.initial,
      this.height,
      this.width,
      this.opacity,
      this.list,
      this.axis});
  Widget child;
  final double height;
  final double width;
  final double opacity;
  final Axis axis;
  final List<Widget> list;
  bool initial;
  static int currentPage = 0;

  PageController controller = new PageController(
    initialPage: currentPage,
    keepPage: true,
    viewportFraction: 1.0,
  );
  initiate(index) {
    double value;
    if (index == currentPage - 1 && initial) value = 1.0;
    if (index == currentPage && initial) value = 0.0;
    if (index == currentPage + 1 && initial) {
      value = 1.0;
      initial = false;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    int count = list.length;
    final Size screenSize = MediaQuery.of(context).size;
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container(
            height: height - 150,
            width: width,
            child: new PageView.builder(
                scrollDirection: axis,
                controller: controller,
                itemCount: count,
                onPageChanged: (i) => setState(() {
                      currentPage = i;
                    }),
                itemBuilder: (context, index) => builder(index)),
          ),
          new Center(
            child: new Container(
                alignment: Alignment.topLeft,
                height: 4.0,
                width: (100.0),
                color: const Color.fromRGBO(250, 250, 250, 0.2),
                padding: new EdgeInsets.only(
                  left: (100.0 / count.toDouble()) * currentPage,
                ),
                child: new Container(
                  width: (20.0),
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        value = initial ? initiate(index) : value = controller.page - index;
        value = (1 - (value.abs() * .2)).clamp(0.0, 1.0);
        return new RotationTransition(
          turns: new AlwaysStoppedAnimation(1800 * (value - 0.8) / 360),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Opacity(
                opacity: pow(value, 4),
                child: new Material(
                  borderRadius: new BorderRadius.circular(
                      (5 - ((1.0 - value) * 25)).clamp(0.1, 5.0)),
                  elevation: (value > 0.9 ? 50.0 : 0.0),
                  child: new Container(
                    height: 350 * value,
                    width: width * value,
                    child: list[index],
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
