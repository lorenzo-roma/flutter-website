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
                    "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Nulla sed neque rutrum,\n pretium nisl eget, gravida neque.\n Aliquam in dignissim quam, at ultricies\n tellus. Nulla sed lectus iaculis, aliquam \nneque a, blandit nibh. Aliquam varius \norci id ligula rhoncus semper. Vivamus \n,nec lectus vitae dui dapibus cursus eget\n sed mauris. Orci varius natoque\n penatibus et magnis dis parturient \nmontes, nascetur ridiculus mus. Sed id \nerat lectus. Aenean ornare metus diam. \nPellentesque eu odio volutpat, vulputate\n velit nec, malesuada lorem.",
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
