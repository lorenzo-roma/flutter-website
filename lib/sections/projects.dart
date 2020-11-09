import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_website/providers/projects_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_website/helpers/layout_helper.dart';
import 'package:flutter_website/widgets/project_card/project_card.dart';
import 'package:flutter_website/widgets/project_card/project_links.dart';
import 'package:flutter_website/widgets/typewriter_text.dart';

double _getCardWidth(BuildContext context, double maxWidth) {
  if (LayoutHelper.isMobileLayout(context)) return maxWidth;
  if (LayoutHelper.isLargeLayout(context)) return maxWidth / 2.5;
  return maxWidth / 2;
}

class SectionProjects extends StatefulWidget {
  @override
  _SectionProjectsState createState() => _SectionProjectsState();
}

class _SectionProjectsState extends State<SectionProjects> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          _SectionTitle(),
          _ProjectList(),
        ],
      ),
    );
  }
}

class _ProjectList extends StatelessWidget {
  const _ProjectList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: context
                .watch<ProjectsProvider>()
                .projects
                .map((p) => ProjectCard(
                    height: constraints.maxHeight,
                    width: _getCardWidth(context, constraints.maxWidth),
                    title: p.title,
                    description: p.description,
                    date: p.date,
                    imgUrl: p.imgUrl,
                    barWidget: ProjectLinks(
                        youtubeLink: p.youtubeLink, gitHubLink: p.gitHubLink)))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: _getTitle(context),
      ),
    );
  }

  Widget _getTitle(BuildContext context) {
    return (LayoutHelper.isMobileLayout(context))
        ? Text("Some of my projects",
            style: Theme.of(context).textTheme.headline2)
        : TypeWriterText(
            text: ["Some of my projects", "I even added their video on YT!"],
            style: Theme.of(context).textTheme.headline2,
          );
  }
}
