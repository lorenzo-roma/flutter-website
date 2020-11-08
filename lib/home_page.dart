import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_website/sections/books.dart';
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
  AnimationController _blackAnimationController;
  AnimationController _contentAnimationController;
  Animation<double> _blackAnimation;
  Animation<double> _contentAnimation;

  @override
  void initState() {
    super.initState();
    _blackAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _contentAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _contentAnimation = CurvedAnimation(
        parent: _contentAnimationController, curve: Curves.easeIn);
    _blackAnimation =
        CurvedAnimation(parent: _blackAnimationController, curve: Curves.easeIn)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              _contentAnimationController.forward();
          });
    _blackAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _blackAnimationController.dispose();
    _contentAnimationController.dispose();
  }

  double _getGlobalPadding(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final padding = pow(w / 100, 4) / 200;
    return padding > 300 ? 300 : padding;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _getGlobalPadding(context), vertical: 0),
      child: FadeTransition(
        opacity: _blackAnimation,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Center(
              child: FadeTransition(
            opacity: _contentAnimation,
            child: CustomSlider(
              slides: [
                CarouselSection(child: SectionNameDescription()),
                CarouselSection(child: SectionCurrently()),
                CarouselSection(child: SectionProjects()),
                CarouselSection(child: SectionBooks())
              ],
            ),
          )),
        ),
      ),
    );
  }
}
