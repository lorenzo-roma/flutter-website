import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'carousel_section.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final CarouselController _controller = CarouselController();
  AnimationController controller;
  Animation<double> animation;

  double _getAspectRation(BuildContext context) {
    return MediaQuery.of(context).size.width /
        MediaQuery.of(context).size.height;
  }

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Center(
          child: Listener(
        onPointerSignal: (pointerSignal) {
          print(pointerSignal);
          if (pointerSignal is PointerScrollEvent) {
            if (pointerSignal.scrollDelta.dy > 0) _controller.nextPage();
            if (pointerSignal.scrollDelta.dy < 0) _controller.previousPage();
          }
        },
        child: Stack(children: [
            CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                enableInfiniteScroll: false,
                aspectRatio: _getAspectRation(context),
                enlargeCenterPage: true,
                scrollDirection: Axis.vertical,
                pageSnapping: true,
              ),
              items: [CarouselSection(), CarouselSection(), CarouselSection()],
            ),
          ]),
        ),
      )),
    );
  }
}
