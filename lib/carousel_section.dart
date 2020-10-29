import 'package:flutter/material.dart';
import 'dart:math';

class CarouselSection extends StatelessWidget {
  static const _colorsList = [Colors.green, Colors.red, Colors.blue];
  Color _color;
  CarouselSection(){
    final generator = new Random();
    this._color = _colorsList[generator.nextInt(3)];
    }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height*0.8;
    return Container(
      width: width,
      height: height,
      color: _color,
    );
  }
}