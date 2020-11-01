import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/widgets/project_card.dart';
import 'package:flutter_website/widgets/typewriter_text.dart';

class SectionProjects extends StatelessWidget {
  const SectionProjects();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TypeWriterText(
              text: ["Some of my projects", "I even added their video on YT!"],
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => CarouselSlider(
                items: [
                  ProjectCard(),
                  ProjectCard(),
                  ProjectCard(),
                ],
                options: CarouselOptions(
                  height: constraints.maxHeight,
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 1,
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
                  .copyWith(color: Color(0xFF00FFC2)),
            ),
          ),
        ],
      ),
    );
  }
}
