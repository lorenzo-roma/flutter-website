import 'package:flutter/material.dart';

class CarouselSection extends StatelessWidget {
  const CarouselSection();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.8;
    return Container(
      width: width,
      height: height,
      color: Colors.blue,
    );
  }
}
