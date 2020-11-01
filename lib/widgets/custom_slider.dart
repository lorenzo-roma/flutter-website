import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';

class CustomSlider extends StatelessWidget {
  final List<Widget> _slides;
  final CarouselController _carouselController = CarouselController();
  CustomSlider({@required List<Widget> slides}) : this._slides = slides;

  double _getAspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.width /
        MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _handlePointerSignal,
      child: _IgnorePointerSignal(
        child: CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            viewportFraction: 0.7,
            enableInfiniteScroll: false,
            aspectRatio: _getAspectRatio(context),
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            pageSnapping: true,
          ),
          items: _slides,
        ),
      ),
    );
  }

  void _handlePointerSignal(PointerSignalEvent e) {
    if (e is PointerScrollEvent && e.scrollDelta.dy != 0) {
      if (e.scrollDelta.dy > 0) _carouselController.nextPage();
      if (e.scrollDelta.dy < 0) _carouselController.previousPage();
    }
  }
}

class _IgnorePointerSignal extends SingleChildRenderObjectWidget {
  _IgnorePointerSignal({Key key, Widget child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(_) => _IgnorePointerSignalRenderObject();
}

class _IgnorePointerSignalRenderObject extends RenderProxyBox {
  @override
  bool hitTest(BoxHitTestResult result, {Offset position}) {
    final res = super.hitTest(result, position: position);
    result.path.forEach((item) {
      final target = item.target;
      if (target is RenderPointerListener) {
        target.onPointerSignal = null;
      }
    });
    return res;
  }
}
