import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final String imgUrl;

  BookCard({
    @required this.height,
    @required this.width,
    @required this.title,
    @required this.imgUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/image_placeholder.jpg',
              image: imgUrl),
        ),
        Text(title, style: Theme.of(context).textTheme.bodyText1),
      ]),
    );
  }
}
