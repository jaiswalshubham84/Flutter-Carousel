// import 'package:flutter/material.dart';

// typedef build = Function(int, PageController);

// class CarouselBuilder extends StatelessWidget {
//   final widget;
//   final PageController controller;
//   final  pageBuilder;
//   final int  currentPage;
//   final int count;
//   CarouselBuilder(
//       {
//       this.widget,
//       this.controller,
//       this.build pageBuilder,
//       this.int currentPage,
//       this.int count
//       }) {}
//   @override
//   Widget build(BuildContext context) {
//     return new PageView.builder(
//         scrollDirection: widget.axis,
//         controller: controller,
//         itemCount: count,
//         onPageChanged: (i) {
//           currentPage = i;
//         },
//         itemBuilder: (context, index) {
//           pageBuilder(index, controller);
//         });
//   }
// }
