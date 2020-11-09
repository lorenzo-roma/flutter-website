import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../helpers/layout_helper.dart';

class ProjectCard extends StatefulWidget {
  static Function _nullFunction() {}
  final Function _expandingCallback;
  final Function _reducingCallback;
  final double _height;
  final double _width;
  final String _title;
  final String _description;
  final DateTime _date;
  final String _imgUrl;
  final Widget _barWidget;

  ProjectCard(
      {Function expandFunction = _nullFunction,
      Function reduceFunction = _nullFunction,
      Widget barWidget,
      @required double height,
      @required double width,
      @required String title,
      @required String description,
      @required DateTime date,
      @required String imgUrl})
      : this._expandingCallback = expandFunction,
        this._reducingCallback = reduceFunction,
        this._barWidget = barWidget,
        this._title = title,
        this._description = description,
        this._date = date,
        this._imgUrl = imgUrl,
        this._height = height,
        this._width = width;

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
    if (LayoutHelper.isMobileLayout(context)) return 25;
    if (LayoutHelper.isLargeLayout(context)) return 50;
    return 40;
  }

  double _getTextHeight() {
    return (_expandAnimation.value / 100 * widget._height);
  }

  double _getTextMaxHeight(BuildContext context) {
    return (_maxPanelPerc / 100 * widget._height) - _getBaseHeight(context);
  }

  double _getTextMinHeight(BuildContext context) {
    return (_minPanelPerc / 100 * widget._height) -
        widget._height * _basePerc / 100;
  }

  double _getBaseHeight(BuildContext context) {
    return _getBorderRadius(context) + widget._height * _basePerc / 100;
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
    return Container(
      height: widget._height,
      width: widget._width,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: GestureDetector(
          onTap: _toggleCardState,
          child: Container(
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
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget._imgUrl),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(
                          Radius.circular(_getBorderRadius(context))),
                    ),
                  ),
                  Positioned(
                    bottom: _getBorderRadius(context) - 1,
                    child: Container(
                      width: constraints.maxWidth,
                      height: _getTextHeight(),
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              height: _getTextMaxHeight(context),
                              width: constraints.maxWidth,
                              child: Stack(children: [
                                Column(children: [
                                  Container(
                                    height: _getTextMinHeight(context),
                                    child: Center(
                                      child: Text(
                                        widget._title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    ),
                                  ),
                                  Text(widget._description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ]),
                                Positioned(
                                    top: 10,
                                    left: 0,
                                    child: Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(widget._date),
                                      style:
                                          LayoutHelper.isMobileLayout(context)
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(fontSize: 12)
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                    )),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: constraints.maxWidth,
                      height: _getBaseHeight(context),
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
                      child: Center(
                        child: (widget._barWidget) ?? Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
