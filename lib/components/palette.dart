import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_oekaki/models/pen_model.dart';

class Palette extends StatelessWidget {
  static const colors = [
    Colors.white,
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lime,
    Colors.green,
    Colors.teal,
    Colors.cyan,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    final pen = Provider.of<PenModel>(context);
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final c = colors[index];
          return GestureDetector(
            onTap: () {
              pen.color = c;
            },
            child: color(c, c == pen.color),
          );
        },
      ),
    );
  }

  Widget color(Color color, bool selected) {
    return Container(
      height: 50,
      width: 45,
      child: Center(
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              width: selected ? 3 : 1,
            ),
          ),
        ),
      ),
    );
  }
}
