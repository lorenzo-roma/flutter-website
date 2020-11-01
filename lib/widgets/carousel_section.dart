import 'package:flutter/material.dart';

class CarouselSection extends StatelessWidget {
  final Widget _child;
  const CarouselSection({child}) : this._child = child;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.8;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        width: width,
        height: height,
        color: Colors.black,
        child: _child,
      ),
    );
  }
}
