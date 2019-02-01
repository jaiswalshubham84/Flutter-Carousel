import 'package:flutter/material.dart';

class Props {
  final int currentPage;
  final Color selectedColor;
  final Color unSelectedColor;
  final int totalPage;
  final double width;
  Props(
      {this.totalPage,
      this.selectedColor,
      this.unSelectedColor,
      this.currentPage,
      this.width});
}
