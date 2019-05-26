import 'package:flutter/widgets.dart';

class PenModel extends ChangeNotifier {
  Color _color = Color(0xff000000);
  double _width = 3;

  get color => _color;
  set color(Color color) {
    _color = color;
    notifyListeners();
  }

  get width => _width;
  set width(double width) {
    _width = width;
    notifyListeners();
  }
}
