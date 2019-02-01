import 'package:carosel/component/carousel/slide_swipe.dart';
import 'package:carosel/component/carousel/x_rotating_carousel.dart';
import 'package:carosel/component/indicator/index.dart';
import 'package:carosel/component/renderer.dart';
import 'package:flutter/material.dart';
import './multi_axis_carousel.dart';
import './rotatingcarousel.dart';
import './simple_carousel.dart';
import './zrotatingcarousel.dart';

class Carousel extends StatefulWidget {
  final String type;

  final Axis axis;

  /// This feild is required.
  ///
  /// Defines the height of the Carousel

  final double height;
  final double width;
  final List<Widget> children;

  /// Defines the Color of the active Indicator
  final Color activeIndicatorColor;

  /// Defines the Color of the non-active Indicator
  final Color unselectedIndicatorColor;

  /// Paint the background of indicator with the color provided
  ///
  /// The default background color is Color(0xff121212)
  final Color indicatorBackgroundColor;

  /// Provide opacity to background of the indicator
  ///
  /// An opacity of 1.0 is fully opaque. An opacity of 0.0 is fully transparent
  /// (i.e., invisible).
  ///
  /// The default value of opacity is 0.5 nothing is initialised.
  ///

  final double indicatorBackgroundOpacity;
  static Axis previousAxis;
  static String previousType;
  static dynamic previousCarousel;
  dynamic updateIndicator;
  PageController controller;

  Carousel(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.type,
      this.indicatorBackgroundOpacity,
      this.unselectedIndicatorColor,
      this.indicatorBackgroundColor,
      this.axis,
      this.activeIndicatorColor,
      @required this.children})
      : super(key: key) {
    this.createState();
  }
  @override
  createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<Carousel> {
  int position = 0;
  double animatedFactor;
  double offset;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    offset = widget.type == "slideswiper" ? 0.8 : 1.0;
    animatedFactor =
        widget.axis == Axis.horizontal ? widget.width : widget.height;
    widget.controller = new PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: offset,
    );
    return Container(
        child: Stack(
      children: <Widget>[
        getCarousel(widget),
        Container(
            margin: EdgeInsets.only(top: widget.height / 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Renderer(1, (data, updateRender, active) {
                  return GestureDetector(
                    onTapUp: (d) {
                      updateRender(1, false);
                      widget.controller.animateTo(
                          animatedFactor * offset * (position - 1),
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 500));
                    },
                    onTapDown: (d) {
                      updateRender(1, true);
                    },
                    child: Container(
                      height: widget.height / 2,
                      width: 40.0,
                      color: active ? Color(0x77121212) : Colors.transparent,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: active ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }),
                Renderer(1, (data, updateRender, active) {
                  return GestureDetector(
                    onTapUp: (d) {
                      updateRender(1, false);
                      widget.controller.animateTo(
                          animatedFactor * offset * (position + 1),
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 500));
                    },
                    onTapDown: (d) {
                      updateRender(1, true);
                    },
                    child: Container(
                      height: widget.height / 2,
                      width: 40.0,
                      color: active ? Color(0x77121212) : Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: active ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }),
              ],
            )),
        Container(
          height: widget.height,
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: <Widget>[
              Container(
                width: widget.width,
                alignment: Alignment.bottomCenter,
                color: (widget.indicatorBackgroundColor ?? Color(0xff121212))
                    .withOpacity(widget.indicatorBackgroundOpacity ?? 0.5),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Renderer(1, (data, updateIndicator, active) {
                  widget.updateIndicator = updateIndicator;
                  position = data;
                  return Indicator(
                    // indicatorName: "bar",
                    indicatorName: "dot",
                    currentPage: data,
                    totalPage: widget.children.length,
                    width: widget.width,
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  getCarousel(dynamic widget) {
    dynamic carousel;
    switch (widget.type.toLowerCase()) {
      case "simple":
        {
          carousel = SimpleCarousel(widget);
        }
        break;
      case "slideswiper":
        {
          carousel = SlideSwipe(widget);
        }
        break;

      case "xrotating":
        {
          print("object = ewg4rg");
          carousel = XcarouselState(widget);
        }
        break;
      case "zrotating":
        {
          carousel = ZcarouselState(widget);
        }
        break;
      case "yrotating":
        {
          carousel = RotatingCarouselState(widget);
        }
        break;
      case "multirotating":
        {
          carousel = MultiAxisCarouselState(widget);
        }
        break;
      case "multirotating":
        {
          carousel = MultiAxisCarouselState(widget);
        }
        break;

      default:
        carousel = SimpleCarousel(widget);
        break;
    }

    if (Carousel.previousType == widget.type &&
        Carousel.previousAxis == widget.axis) {
      carousel = Carousel.previousCarousel;
    } else {
      Carousel.previousType = widget.type;
      Carousel.previousAxis = widget.axis;
      Carousel.previousCarousel = carousel;
    }
    return carousel;
  }
}
