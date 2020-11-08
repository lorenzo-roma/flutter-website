import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_website/layout_utils.dart';
import 'package:flutter_website/models/project.dart';
import 'package:flutter_website/widgets/project_card/project_card.dart';
import 'package:flutter_website/widgets/project_card/project_links.dart';
import 'package:flutter_website/widgets/typewriter_text.dart';

class SectionProjects extends StatefulWidget {
  @override
  _SectionProjectsState createState() => _SectionProjectsState();
}

class _SectionProjectsState extends State<SectionProjects> {
  final _projects = [
    Project(
        title: "Titolo",
        description: "Descrizione",
        imgUrl: "https://picsum.photos/500/500/",
        youtubeLink: "",
        gitHubLink: ""),
    Project(
        title: "Titolo",
        description: "Descrizione",
        imgUrl: "https://picsum.photos/500/500/",
        youtubeLink: ""),
    Project(
        title: "Titolo",
        description: "Descrizione",
        imgUrl: "https://picsum.photos/500/500/",
        gitHubLink: "")
  ];

  final CarouselController _carouselController = CarouselController();

  double _getCardWidth(BuildContext context, double maxWidth) {
    if (LayoutUtils.isMobileLayout(context)) return maxWidth;
    if (LayoutUtils.isLargeLayout(context)) return maxWidth / 2.5;
    return maxWidth / 2;
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
              builder: (context, constraints) => Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: _projects
                      .map((p) => ProjectCard(
                          height: constraints.maxHeight,
                          width: _getCardWidth(context, constraints.maxWidth),
                          title: p.title,
                          description: p.description,
                          imgUrl: p.imgUrl,
                          barWidget: ProjectLinks(
                              youtubeLink: p.youtubeLink,
                              gitHubLink: p.gitHubLink)))
                      .toList(),
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
