import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:simple_oekaki/models/pen_model.dart';

class StrokesModel extends ChangeNotifier {
  List<Stroke> _strokes = [];

  get all => _strokes;

  void add(PenModel pen, Offset offset) {
    _strokes.add(Stroke(pen.color)..add(offset));
    notifyListeners();
  }

  void update(Offset offset) {
    _strokes.last.add(offset);
    notifyListeners();
  }

  void clear() {
    _strokes = [];
    notifyListeners();
  }
}

class Stroke {
  final List<Offset> points = [];
  final Color color;

  Stroke(this.color);

  add(Offset offset) {
    points.add(offset);
  }
}
