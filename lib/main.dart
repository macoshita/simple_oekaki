import 'package:flutter/material.dart';
import 'package:simple_oekaki/models/strokes_model.dart';
import 'package:simple_oekaki/screens/paper_screen.dart';
import 'package:provider/provider.dart';

import 'models/pen_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (BuildContext context) => PenModel(),
        ),
        ChangeNotifierProvider(
          builder: (BuildContext context) => StrokesModel(),
        ),
      ],
      child: MaterialApp(
        home: SafeArea(
          child: PaperScreen(),
        ),
      ),
    );
  }
}
