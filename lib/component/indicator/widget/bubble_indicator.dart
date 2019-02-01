import 'package:carosel/component/indicator/widget/props.dart';
import 'package:carosel/service/screen_ratio.dart';
import 'package:flutter/material.dart';

class BubbleIndicator extends StatelessWidget {
  Props props;
  double wf = ScreenRatio.widthRatio;
  BubbleIndicator({this.props});
  @override
  Widget build(BuildContext context) {
    print(props.width);
    print((((props.width * wf) / (props.totalPage * 2.5))));
    return new Container(
      alignment: Alignment.topLeft,
      height: 20.0,
      child: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[]
              ..addAll(List.generate(props.totalPage, (int index) {
                return Center(
                  child: Container(
                    width:
                        ((props.width * wf) / props.totalPage).clamp(2.0, 16.0),
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        height: (((props.width * wf) / (props.totalPage * 2))
                                .clamp(1.0, 8.0)) *
                            (props.currentPage == index ? 2.0 : 1.0),
                        width: (((props.width * wf) / (props.totalPage * 2))
                                .clamp(1.0, 8.0)) *
                            (props.currentPage == index ? 2.0 : 1.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: props.currentPage == index
                              ? props.selectedColor ?? Colors.black
                              : props.unSelectedColor ?? Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }))),
      ),
    );
  }
}
