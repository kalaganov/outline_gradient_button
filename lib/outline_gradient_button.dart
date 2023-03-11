library outline_gradient_button;

import 'package:flutter/material.dart';

/// OutlineGradientButton
class OutlineGradientButton extends StatelessWidget {
  final double strokeWidth;
  final Radius? radius;
  final Corners? corners;
  final Gradient gradient;
  final EdgeInsets padding;
  final Color backgroundColor;
  final double elevation;
  final bool inkWell;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCancelCallback? onTapCancel;
  final ValueChanged<bool>? onHighlightChanged;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final BorderRadius _borderRadius;
  final Widget child;

  OutlineGradientButton({
    required this.strokeWidth,
    required this.gradient,
    this.corners,
    this.radius,
    this.padding = const EdgeInsets.all(8),
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.inkWell = false,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.onFocusChange,
    required this.child,
    super.key,
  })  : assert(strokeWidth > 0),
        assert(padding.isNonNegative),
        assert(elevation >= 0),
        assert(radius == null || corners == null,
            'Cannot provide both a radius and corners.'),
        _borderRadius = corners != null
            ? _fromCorners(corners, strokeWidth)
            : _fromRadius(radius ?? Radius.zero, strokeWidth);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      elevation: elevation,
      borderRadius: _borderRadius,
      child: InkWell(
        borderRadius: _borderRadius,
        highlightColor:
            inkWell ? Theme.of(context).highlightColor : Colors.transparent,
        splashColor:
            inkWell ? Theme.of(context).splashColor : Colors.transparent,
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        onHighlightChanged: onHighlightChanged,
        onHover: onHover,
        onFocusChange: onFocusChange,
        child: CustomPaint(
          painter: _Painter(gradient, radius, strokeWidth, corners),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }

  ///
  static BorderRadius _fromCorners(Corners corners, double strokeWidth) {
    return BorderRadius.only(
      topLeft: Radius.elliptical(
        corners.topLeft.x + strokeWidth,
        corners.topLeft.y + strokeWidth,
      ),
      topRight: Radius.elliptical(
        corners.topRight.x + strokeWidth,
        corners.topRight.y + strokeWidth,
      ),
      bottomLeft: Radius.elliptical(
        corners.bottomLeft.x + strokeWidth,
        corners.bottomLeft.y + strokeWidth,
      ),
      bottomRight: Radius.elliptical(
        corners.bottomRight.x + strokeWidth,
        corners.bottomRight.y + strokeWidth,
      ),
    );
  }

  ///
  static BorderRadius _fromRadius(Radius radius, double strokeWidth) {
    return BorderRadius.all(
      Radius.elliptical(
        radius.x + strokeWidth,
        radius.y + strokeWidth,
      ),
    );
  }
}

///
class _Painter extends CustomPainter {
  final Gradient gradient;
  final Radius? radius;
  final double strokeWidth;
  final Corners? corners;

  _Painter(this.gradient, this.radius, this.strokeWidth, this.corners);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = _createRect(strokeWidth, size);
    final rRect = corners != null
        ? _createRRectFromRectAndCorners(rect, corners!)
        : RRect.fromRectAndRadius(rect, radius ?? Radius.zero);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);
    canvas.drawRRect(rRect, paint);
  }

  ///
  static Rect _createRect(double strokeWidth, Size size) {
    return Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );
  }

  ///
  static RRect _createRRectFromRectAndCorners(Rect rect, Corners corners) {
    return RRect.fromRectAndCorners(
      rect,
      topLeft: corners.topLeft,
      topRight: corners.topRight,
      bottomLeft: corners.bottomLeft,
      bottomRight: corners.bottomRight,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

///
class Corners {
  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;

  const Corners({
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
  });
}
