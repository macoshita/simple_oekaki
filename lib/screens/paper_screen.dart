import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_oekaki/components/palette.dart';
import 'package:simple_oekaki/components/paper.dart';
import 'package:simple_oekaki/models/strokes_model.dart';

class PaperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Paper(),
          Align(
            alignment: Alignment.topLeft,
            child: Palette(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('削除します'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      strokes.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
