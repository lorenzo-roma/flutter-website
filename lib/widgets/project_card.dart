import 'dart:ui';

import 'package:flutter/material.dart';

import '../layout_utils.dart';

class ProjectCard extends StatefulWidget {
  final Function _expandingCallback;
  final Function _reducingCallback;

  ProjectCard({@required expandFunction, @required reduceFunction})
      : this._expandingCallback = expandFunction,
        this._reducingCallback = reduceFunction;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  static const _expandVelocity = 600;
  static const _minPanelPerc = 30.0;
  static const _maxPanelPerc = 70.0;
  static const _basePerc = 10;
  AnimationController _expandAnimationController;
  Animation<double> _expandAnimation;

  bool get _isPanelExpanded {
    return _expandAnimation.isCompleted;
  }

  void _toggleCardState() {
    if (_isPanelExpanded) {
      widget._reducingCallback();
      _expandAnimationController.reverse();
    } else {
      widget._expandingCallback();
      _expandAnimationController.forward();
    }
  }

  double _getBorderRadius(BuildContext context) {
    if (LayoutUtils.isMobileLayout(context)) return 25;
    if (LayoutUtils.isLargeLayout(context)) return 50;
    return 40;
  }

  double _getTextHeight(double maxHeight) {
    return (_expandAnimation.value / 100 * maxHeight);
  }

  double _getBaseHeight(BuildContext context, double maxHeight) {
    return _getBorderRadius(context) + maxHeight * _basePerc / 100;
  }

  @override
  void initState() {
    super.initState();
    _expandAnimationController = AnimationController(
        duration: Duration(milliseconds: _expandVelocity), vsync: this);
    _expandAnimation = Tween<double>(begin: _minPanelPerc, end: _maxPanelPerc)
        .animate(CurvedAnimation(
            parent: _expandAnimationController, curve: Curves.easeInOutBack))
          ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _expandAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: GestureDetector(
        onTap: _toggleCardState,
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(_getBorderRadius(context))),
              boxShadow: [
                BoxShadow(
                    color: Colors.white24,
                    blurRadius: 15,
                    spreadRadius: 0,
                    offset: Offset(0, 5))
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://picsum.photos/500/500/'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(
                        Radius.circular(_getBorderRadius(context))),
                  ),
                ),
                Positioned(
                  bottom: _getBorderRadius(context) - 1,
                  child: Container(
                    width: constraints.maxWidth,
                    height: _getTextHeight(constraints.maxHeight),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Container(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    height: _getBaseHeight(context, constraints.maxHeight),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(_getBorderRadius(context)),
                          bottomRight:
                              Radius.circular(_getBorderRadius(context))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
