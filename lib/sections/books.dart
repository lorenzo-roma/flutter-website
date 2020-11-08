import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          _Email(),
        ],
      ),
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        "r.lorenzo1810@gmail.com",
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Theme.of(context).accentColor),
      ),
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
        child: TypeWriterText(
          text: ["I love reading", "Here are some books I read"],
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
