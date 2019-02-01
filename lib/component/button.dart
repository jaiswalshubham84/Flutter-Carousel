import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final dynamic color;
  final String text;
  final double height;
  final double width;
  final Function onPressed;
  RoundButton({this.color, this.text, this.height, this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: height,
      decoration: new BoxDecoration(
          color: color,
          borderRadius: new BorderRadius.all(new Radius.circular(height))),
      child: new Material(
        child: new InkWell(
          borderRadius: new BorderRadius.all(new Radius.circular(height)),
          onTap: this.onPressed,
          child: new Center(
            child: new Text(
              text,
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
