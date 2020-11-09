import 'package:flutter/material.dart';
import 'package:flutter_website/helpers/layout_helper.dart';
import 'package:flutter_website/widgets/typewriter_text.dart';

class SectionCurrently extends StatelessWidget {
  const SectionCurrently();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _SectionTitle(),
        _CurrentyStudying(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text("&",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2),
        ),
        _CurrentlyWorking(),
      ]),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: FittedBox(
        fit: BoxFit.cover,
        child: _getTitle(context),
      ),
    );
  }

  TypeWriterText _getTitle(BuildContext context) {
    return LayoutHelper.isMobileLayout(context)
        ? Text("Currently I am", style: Theme.of(context).textTheme.headline2)
        : TypeWriterText(
            text: [
              "Currently I am",
              "Well, actually I always do a lot of things...",
              "Ok let's say mainly I am: "
            ],
            style: Theme.of(context).textTheme.headline2,
          );
  }
}

class _CurrentlyWorking extends StatelessWidget {
  const _CurrentlyWorking({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          top: -10,
          left: 32,
          child: Container(
            constraints: BoxConstraints(maxHeight: 80),
            child: Opacity(
              opacity: 0.4,
              child: Image.asset('assets/images/tutored_logo.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.headline2,
              children: <TextSpan>[
                TextSpan(
                  text: "Working as Web\n and Mobile Developer @ ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                TextSpan(
                  text: "Tutored",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Color(0xFFFF4B00)),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class _CurrentyStudying extends StatelessWidget {
  const _CurrentyStudying({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 32,
            top: -10,
            child: Container(
              constraints: BoxConstraints(maxHeight: 80),
              child: Opacity(
                opacity: 0.4,
                child: Image.asset('assets/images/polimi_logo.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Studiyng\n Computer Engeeering @ PoliMi",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2),
          ),
        ],
      ),
    );
  }
}
