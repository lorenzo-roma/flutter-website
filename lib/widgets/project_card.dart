import 'dart:ui';

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

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  static const _expandVelocity = 600;
  static const _startBlur = 0.0;
  static const _expandBlur = 5.0;
  static const _imageFlex = 3;
  static const _textInitialFlex = 2;
  double _targetBlur = _startBlur;
  bool _animating = false;
  bool _expanded = false;
  int _textFlex = 2;
  int _velocity = 0;

  void _toggleCardState() {
    if (_animating) return;
    _animating = true;
    Future.delayed(Duration(milliseconds: _expandVelocity), () {
      _animating = false;
    });
    setState(() {
      _textFlex = (_textFlex == 8) ? 2 : 8;
      _targetBlur = (_targetBlur == _expandBlur) ? _startBlur : _expandBlur;
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
    return (_imageFlex * maxHeight) / (_imageFlex + _textInitialFlex) + 20;
  }

  double _getTextHeight(double maxHeight) {
    return (_textFlex * maxHeight) / (_imageFlex + _textFlex);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: _toggleCardState,
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        height: _getImageHeight(constraints.maxHeight),
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://lh3.googleusercontent.com/proxy/Qe-e3QINO10FkanMqEQy1W4AOILydcucoX62JoXpBiuMRjrsvX2WR8vYmCdIZfSu9fdOQWoWdt9-O13_f2J7VNa0TbqbyDUMM2hCXghbLccpyeeeM3vPSvScWmEXx6taWSUYtCwRWLsldllDTt-Fw0Xe6tOz_amF4zPdggevtvP6FvQAIg',
                              ),
                              fit: BoxFit.fitWidth),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: ClipRRect(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          child: TweenAnimationBuilder(
                            curve: Curves.easeInOut,
                            tween: Tween<double>(
                                begin: _startBlur, end: _targetBlur),
                            duration: Duration(milliseconds: _expandVelocity),
                            builder: (BuildContext context, double _blur,
                                    Widget _child) =>
                                BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: _blur, sigmaY: _blur),
                              child: _child,
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: _velocity),
                        curve: Curves.easeInOutBack,
                        width: constraints.maxWidth,
                        height: _getTextHeight(constraints.maxHeight),
                        decoration: BoxDecoration(
                          color: Color(0xFF003B27),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 20.0,
                                spreadRadius: 10.0),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                        ),
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
