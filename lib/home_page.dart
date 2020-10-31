import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_website/widgets/custom_slider.dart';
import 'package:flutter_website/widgets/carousel_section.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Center(
          child: CustomSlider(
        slides: const [CarouselSection(), CarouselSection(), CarouselSection()],
      )),
    );
  }
}
