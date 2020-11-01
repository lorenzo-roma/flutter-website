import 'package:flutter/material.dart';

class SectionNameDescription extends StatelessWidget {
  const SectionNameDescription();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                "Lorenzo",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                "Romagnoni",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24, top: 8),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "> Developer",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12, top: 16.0),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Nulla sed neque rutrum,\n pretium nisl eget, gravida neque.\n Aliquam in dignissim quam, at ultricies\n tellus. Nulla sed lectus iaculis, aliquam \nneque a, blandit nibh. Aliquam varius \norci id ligula rhoncus semper. Vivamus \n,nec lectus vitae dui dapibus cursus eget\n sed mauris. Orci varius natoque\n penatibus et magnis dis parturient \nmontes, nascetur ridiculus mus. Sed id \nerat lectus. Aenean ornare metus diam. \nPellentesque eu odio volutpat, vulputate\n velit nec, malesuada lorem.",
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    ]);
  }
}
