import 'package:flutter/material.dart';
import 'package:flutter_website/helpers/layout_helper.dart';

class SectionNameDescription extends StatelessWidget {
  const SectionNameDescription();

  double _getSpreadRadius(BuildContext context) {
    if (LayoutHelper.isMobileLayout(context)) return -35;
    if (LayoutHelper.isLargeLayout(context)) return -30;
    return -50;
  }

  List<Widget> _getFlexChildren(BuildContext context) {
    return [
      Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "Lorenzo\nRomagnoni",
                  textAlign: LayoutHelper.isMobileLayout(context)
                      ? TextAlign.center
                      : TextAlign.left,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0, top: 8, bottom: 8),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "> Developer",
                    textAlign: LayoutHelper.isMobileLayout(context)
                        ? TextAlign.center
                        : TextAlign.left,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(color: Colors.black, boxShadow: [
            BoxShadow(
                color: Theme.of(context).accentColor,
                blurRadius: 50,
                spreadRadius: _getSpreadRadius(context)),
          ]),
          child: Center(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "Determined and enterprising developer\n from Milan, Italy! 🟩⬜🟥\nTech lover👨‍💻 and extremely curious,\n I always want to learn more from disparate\n fields: web and mobile development,\n AI🤖,finance📈, sociology,\n psychology🧠 and more.\nFrequently thinking about my \nnext journey✈️, next projects and goals🏆.\nI love reading📘, I think it\nis the most powerful way to learn from\nextraordinary people, from all over\nthe world (space🌍) and history (time⌛)!.\n",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutHelper.isMobileLayout(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _getFlexChildren(context))
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getFlexChildren(context));
  }
}
