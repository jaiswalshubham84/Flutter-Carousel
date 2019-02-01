import 'package:carosel/component/indicator/widget/props.dart';
import 'package:flutter/material.dart';

class BarIndicator extends StatelessWidget {
  Props props;
  BarIndicator({this.props});
  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: Alignment.topLeft,
        height: 4.0,
        width: ((props.width) * .80),
        color: props.unSelectedColor ?? Color(0xff4C5158),
        padding: new EdgeInsets.only(
          left: (((props.width * 0.8) / props.totalPage) * (props.currentPage)),
        ),
        child: new Container(
          width: (props.width * 0.8) / props.totalPage,
          color: props.selectedColor ?? Colors.black,
        ));
  }
}
