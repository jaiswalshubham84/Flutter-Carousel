import 'package:carosel/component/indicator/widget/props.dart';
import 'package:carosel/service/screen_ratio.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  Props props;
  double wf = ScreenRatio.widthRatio;
  DotIndicator({this.props});
  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: Alignment.topLeft,
        height: 20.0,
        // width: (20.0 * count),
        // color: Colors.blue.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[]..addAll(List.generate(
              40,
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
                          color: props.currentPage == index
                              ? props.selectedColor ?? Colors.black
                              : props.unSelectedColor ?? Colors.white,
                        ),
                      ),
                    ),
                  )).toList()),
        )

        // ListView.builder(
        //   itemCount: 40,
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (context, index) {
        //     return Container(
        //       height: 40.0,
        //       width: 40.0,
        //       padding: EdgeInsets.only(right: 1.0, left: 1.0),
        //       margin: EdgeInsets.only(left: 10.0, right: 10.0),
        //       child: Center(
        //         child: AnimatedContainer(
        //           duration: Duration(milliseconds: 100),
        //           height: 10.0,
        //           width: 10.0,
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: props.currentPage == index
        //                 ? Colors.red.shade300
        //                 : Colors.white,
        //             border: Border.all(color: Colors.red.shade300),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // )
        );
  }
}
