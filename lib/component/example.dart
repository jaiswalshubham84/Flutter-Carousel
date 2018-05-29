import 'package:flutter/material.dart';
import 'package:carosel/component/carousel/index.dart';
import 'package:carosel/component/carousel/rotatingcarousel.dart';
import 'package:carosel/component/carousel/zrotatingcarousel.dart';
import 'package:carosel/component/carousel/xrotatingcarousel.dart';
import 'package:carosel/component/carousel/multi_axis_carousel.dart';
import 'data.dart';
import 'style.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => new _ExampleState();
}

class _ExampleState extends State<Example> {
  int i = 0;
  List<dynamic> list = new DataListBuilder().cardList;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new MaterialApp(
      home: new DefaultTabController(
        length: 8,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(
                  text: '1',
                ),
                new Tab(
                  text: '2',
                ),
                new Tab(
                  text: '3',
                ),
                new Tab(
                  text: '4',
                ),
                new Tab(
                  text: '5',
                ),
                new Tab(
                  text: '6',
                ),
                new Tab(
                  text: '7',
                ),
                new Tab(
                  text: '8',
                ),
              ],
            ),
            title: new Text('Carousel Demo'),
          ),
          body: new TabBarView(
            children: [
              new Container(
                child: new SimpleCarousel(
                  height: screenSize.height,
                  width: screenSize.width,
                  opacity: 1.0,
                  children: list.map((l) {
                    i++;
                    return (new Container(
                      decoration: decoration(l.pic),
                    ));
                  }).toList(),
                ),
              ),
              new Container(
                child: new RotatingCarousel(
                  height: screenSize.height,
                  width: screenSize.width,
                  axis: Axis.horizontal,
                  opacity: 1.0,
                  children: list.map((l) {
                    i++;
                    return (new Container(
                      decoration: decoration(l.pic),
                    ));
                  }).toList(),
                ),
              ),
              new Container(
                child: new Zcarousel(
                  height: screenSize.height,
                  width: screenSize.width,
                  axis: Axis.horizontal,
                  opacity: 1.0,
                  children: list.map((l) {
                    i++;
                    return (new Container(
                      decoration: decoration(l.pic),
                    ));
                  }).toList(),
                ),
              ),
              new Container(
                child: new MultiAxisCarousel(
                  height: screenSize.height,
                  width: screenSize.width,
                  axis: Axis.horizontal,
                  opacity: 1.0,
                  children: list.map((l) {
                    i++;
                    return (new Container(
                      decoration: decoration(l.pic),
                    ));
                  }).toList(),
                ),
              ),
              new Container(
                child: new RotatingCarousel(
                  height: screenSize.height,
                  width: screenSize.width,
                  axis: Axis.vertical,
                  opacity: 1.0,
                  children: list.map((l) {
                    i++;
                    return (new Container(
                      decoration: decoration(l.pic),
                    ));
                  }).toList(),
                ),
              ),
              new Container(
                child: new MultiAxisCarousel(
                  height: screenSize.height,
                  width: screenSize.width,
                  axis: Axis.vertical,
                  opacity: 1.0,
                  children: list.map((l) {
                    i++;
                    return (new Container(
                      decoration: decoration(l.pic),
                    ));
                  }).toList(),
                ),
              ),
              new Container(
                child: new Zcarousel(
                  height: screenSize.height,
                  width: screenSize.width,
                  axis: Axis.vertical,
                  opacity: 1.0,
                  children: list.map((l) {
                    i++;
                    return (new Container(
                      decoration: decoration(l.pic),
                    ));
                  }).toList(),
                ),
              ),
              new Container(
                child: new Xcarousel(
                  height: screenSize.height,
                  width: screenSize.width,
                  axis: Axis.vertical,
                  opacity: 1.0,
                  children: list.map((l) {
                    i++;
                    return (new Container(
                      decoration: decoration(l.pic),
                    ));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
