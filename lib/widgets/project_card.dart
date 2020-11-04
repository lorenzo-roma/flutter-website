import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final Function _expandingCallback;
  final Function _reducingCallback;

  ProjectCard({@required expandFunction, @required reduceFunction})
      : this._expandingCallback = expandFunction,
        this._reducingCallback = reduceFunction;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  static const _expandVelocity = 600;
  bool _animating = false;
  bool _expanded = false;
  int _imageFlex = 3;
  int _textFlex = 2;
  int _velocity = 0;

  void _toggleCardState() {
    if (_animating) return;
    _animating = true;
    Future.delayed(Duration(milliseconds: _expandVelocity), () {
      _animating = false;
    });
    setState(() {
      _imageFlex = (_imageFlex == 1) ? 3 : 1;
      _textFlex = (_textFlex == 4) ? 2 : 4;
      _expanded = !_expanded;
      if (_expanded) {
        _velocity = _expandVelocity;
      } else {
        Future.delayed(Duration(milliseconds: _expandVelocity), () {
          _velocity = 0;
        });
      }
    });
    if (_expanded) {
      widget._expandingCallback();
    } else {
      widget._reducingCallback();
    }
  }

  double _getImageHeight(double maxHeight) {
    return (_imageFlex * maxHeight) / (_imageFlex + _textFlex);
  }

  double _getTextHeight(double maxHeight) {
    return (_textFlex * maxHeight) / (_imageFlex + _textFlex);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: _toggleCardState,
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: _velocity),
                      curve: Curves.easeInOutBack,
                      height: _getImageHeight(constraints.maxHeight),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: _velocity),
                      curve: Curves.easeInOutBack,
                      height: _getTextHeight(constraints.maxHeight),
                      decoration: BoxDecoration(
                        color: Colors.cyan[900],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
