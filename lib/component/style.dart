import 'package:flutter/material.dart';

decoration(pic) {
  return new BoxDecoration(
      image: new DecorationImage(
        image: new AssetImage(pic),
        fit: BoxFit.cover,
      ),
      color: Colors.white);
}
