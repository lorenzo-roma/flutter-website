import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/layout_utils.dart';
import 'package:flutter_website/widgets/project_card.dart';
import 'package:flutter_website/widgets/typewriter_text.dart';

class SectionProjects extends StatefulWidget {
  @override
  _SectionProjectsState createState() => _SectionProjectsState();
}

class _SectionProjectsState extends State<SectionProjects> {
  final _projects = [1, 2, 3];

  final CarouselController _carouselController = CarouselController();

  void _stopAutoPlayProjects(CarouselController controller) =>
      controller.stopAutoPlay();

  double _getViewPortFraction(BuildContext context) {
    if (LayoutUtils.isMobileLayout(context)) return 1;
    if (LayoutUtils.isLargeLayout(context)) return 0.4;
    return 0.6;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TypeWriterText(
                text: [
                  "Some of my projects",
                  "I even added their video on YT!"
                ],
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => CarouselSlider(
                carouselController: _carouselController,
                items: _projects
                    .map((project) => ProjectCard(
                          expandFunction: _carouselController.stopAutoPlay,
                          reduceFunction: _carouselController.startAutoPlay,
                        ))
                    .toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  height: constraints.maxHeight,
                  autoPlayInterval: Duration(seconds: 2),
                  viewportFraction: _getViewPortFraction(context),
                  autoPlay: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "r.lorenzo1810@gmail.com",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
