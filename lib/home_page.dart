import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_website/sections/currently.dart';
import 'package:flutter_website/sections/name_description.dart';
import 'package:flutter_website/sections/projects.dart';
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
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  double _getGlobalPadding(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final padding = pow(w / 100, 4) / 200;
    return padding > 300 ? 300 : padding;
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _getGlobalPadding(context)),
          child: Center(
              child: CustomSlider(
            slides: const [
              CarouselSection(child: SectionNameDescription()),
              CarouselSection(child: SectionCurrently()),
              CarouselSection(child: SectionProjects())
            ],
          )),
        ),
      ),
    );
  }
}
