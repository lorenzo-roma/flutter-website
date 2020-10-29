import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'carousel_section.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();

  double _getAspectRation(BuildContext context) {
    return MediaQuery.of(context).size.width /
        MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          // do something when scrolled
          print(pointerSignal.scrollDelta);
          _controller.nextPage();
        }
      },
      child: Stack(
              children: [
                CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            aspectRatio: _getAspectRation(context),
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            pageSnapping: true,
          ),
          items: [CarouselSection(), CarouselSection(), CarouselSection()],
        ),
        Container(child: Expanded(child: Container(),))
        ]
      ),
    ));
  }
}
