import 'package:carosel/component/button.dart';
import 'package:carosel/component/carousel/carousel.dart';
import 'package:carosel/component/data.dart';
import 'package:carosel/component/style.dart';
import 'package:carosel/service/screen_ratio.dart';
import 'package:flutter/material.dart';

class CarouselDemoExample extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<CarouselDemoExample> {
  Axis axis = Axis.horizontal;
  String type = "simple";
  String axisType = "HORIZONTAL";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double hf = size.height / 667.0;
    double wf = size.width / 375.0;
    ScreenRatio.setScreenRatio(size: size);
    print(axis);
    int i = 0;

    List<dynamic> list = new DataListBuilder().cardList;
    return new Scaffold(
      body: Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(top: 40.0),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[]..addAll(["HORIZONTAL", "VERTICAL"]
                  .map(
                    (String axisType) => new RoundButton(
                          height: 40.0 * hf,
                          width: 160.0 * hf,
                          color: this.axisType == axisType
                              ? Color(0xff4C70C7)
                              : Color(0xffb5b8b9),
                          text: axisType,
                          onPressed: () {
                            this.setState(() {
                              this.axisType = axisType;
                              axis = axisType == "HORIZONTAL"
                                  ? Axis.horizontal
                                  : Axis.vertical;
                            });
                          },
                        ),
                  )
                  .toList())),
          new Container(
            padding: new EdgeInsets.only(top: 30.0 * hf, bottom: 30.0 * hf),
            child: Carousel(
              height: 350.0 * hf,
              width: size.width,
              type: type,
              axis: axis,
              children: list.map((l) {
                i++;
                return (new Container(
                  decoration: decoration(l.pic),
                ));
              }).toList(),
            ),
          ),
          Wrap(
              direction: Axis.horizontal,
              spacing: 5.0 * wf,
              runSpacing: 10.0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[]..addAll([
                  "simple",
                  "slideswiper",
                  "xRotating",
                  "yrotating",
                  "zRotating",
                  "multirotating"
                ]
                    .map(
                      (String carouselType) => new RoundButton(
                            height: 45.0 * hf,
                            width: carouselType == "multirotating"
                                ? 135.0 * hf
                                : 125.0 * hf,
                            color: type == carouselType
                                ? Color(0xff8FAD16)
                                : Color(0xffb5b8b9),
                            text: carouselType,
                            onPressed: () {
                              this.setState(() {
                                type = carouselType;
                              });
                            },
                          ),
                    )
                    .toList())

              // new Example()
              ),
        ],
      ),
      // ),
    );
  }
}
