import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TypeWriterText extends StatelessWidget {
  final List<String> _text;
  final TextStyle _textStyle;
  const TypeWriterText({@required text, @required style})
      : _text = text,
        _textStyle = style;

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedTextKit(
      speed: Duration(milliseconds: 80),
      repeatForever: true,
      pause: Duration(milliseconds: 2000),
      text: _text,
      textStyle: _textStyle,
    );
  }
}
