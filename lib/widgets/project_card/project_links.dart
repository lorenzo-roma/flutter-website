import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../layout_utils.dart';

EdgeInsets _getIconPadding(BuildContext context) {
  if (LayoutUtils.isMobileLayout(context)) return EdgeInsets.all(8);
  if (LayoutUtils.isLargeLayout(context)) return EdgeInsets.all(20);
  return EdgeInsets.all(16);
}

void _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ProjectLinks extends StatelessWidget {
  final String youtubeLink;
  final String gitHubLink;
  final List<Widget> _iconList = [];
  ProjectLinks({this.youtubeLink, this.gitHubLink}) {
    if (this.youtubeLink != null) _iconList.add(_YoutubeIcon(youtubeLink));
    if (this.gitHubLink != null) _iconList.add(_GitHubIcon(gitHubLink));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: _iconList);
  }
}

class _YoutubeIcon extends StatelessWidget {
  final String youtubeLink;
  _YoutubeIcon(this.youtubeLink);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _getIconPadding(context),
      child: GestureDetector(
          onTap: () => _launchUrl(youtubeLink),
          child: Image.asset('images/youtube_logo.png')),
    );
  }
}

class _GitHubIcon extends StatelessWidget {
  final String gitHubLink;
  _GitHubIcon(this.gitHubLink);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _getIconPadding(context),
      child: GestureDetector(
          onTap: () => _launchUrl(gitHubLink),
          child: Image.asset('images/github_logo.png')),
    );
  }
}
