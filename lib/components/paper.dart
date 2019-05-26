import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_oekaki/models/pen_model.dart';
import 'package:simple_oekaki/models/strokes_model.dart';

class Paper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pen = Provider.of<PenModel>(context);
    final strokes = Provider.of<StrokesModel>(context);

    return Listener(
      onPointerDown: (details) {
        strokes.add(pen, details.position);
      },
      onPointerMove: (details) {
        strokes.update(details.position);
      },
      onPointerUp: (details) {
        strokes.update(details.position);
      },
      child: CustomPaint(
        painter: _Painter(strokes),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final StrokesModel strokes;

  _Painter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    strokes.all.forEach((stroke) {
      final paint = Paint()
        ..color = stroke.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 3;
      canvas.drawPoints(PointMode.polygon, stroke.points, paint);
    });
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return true;
  }
}
