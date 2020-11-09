import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_website/providers/books_provider.dart';
import 'package:flutter_website/widgets/book_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_website/helpers/layout_helper.dart';
import 'package:flutter_website/widgets/typewriter_text.dart';

double _getCardWidth(BuildContext context, double maxWidth) {
  if (LayoutHelper.isMobileLayout(context)) return maxWidth / 2;
  if (LayoutHelper.isLargeLayout(context)) return maxWidth / 5;
  return maxWidth / 4;
}

double _getImageContactHeight(BuildContext context) {
  if (LayoutHelper.isMobileLayout(context)) return 30.0;
  if (LayoutHelper.isLargeLayout(context)) return 50.0;
  return 50.0;
}

void _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class SectionBooks extends StatefulWidget {
  @override
  _SectionBooksState createState() => _SectionBooksState();
}

class _SectionBooksState extends State<SectionBooks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          _SectionTitle(),
          _BooksList(),
          _Contacts(),
        ],
      ),
    );
  }
}

class _Contacts extends StatelessWidget {
  const _Contacts({
    Key key,
  }) : super(key: key);

  static const String PERSONAL_GITHUB_PAGE = "https://github.com/lorenzo-roma";
  static const String PERSONAL_MEDIUM_PAGE =
      "https://lorenzoromagnoni.medium.com/";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "r.lorenzo1810@gmail.com",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Theme.of(context).accentColor),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _launchUrl(PERSONAL_GITHUB_PAGE),
              child: Image.asset(
                'assets/images/github_logo_white.png',
                height: _getImageContactHeight(context),
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(width: 16.0),
            GestureDetector(
              onTap: () => _launchUrl(PERSONAL_MEDIUM_PAGE),
              child: Image.asset(
                'assets/images/medium_logo.png',
                height: _getImageContactHeight(context),
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _BooksList extends StatelessWidget {
  const _BooksList({
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
                .watch<BooksProvider>()
                .books
                .map((b) => BookCard(
                      height: constraints.maxHeight,
                      width: _getCardWidth(context, constraints.maxWidth),
                      title: b.title,
                      imgUrl: b.imgUrl,
                    ))
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
    return LayoutHelper.isMobileLayout(context)
        ? Text(
            "I love reading, here are some books I read",
            style: Theme.of(context).textTheme.headline2,
          )
        : TypeWriterText(
            text: ["I love reading", "Here are some books I read"],
            style: Theme.of(context).textTheme.headline2,
          );
  }
}
