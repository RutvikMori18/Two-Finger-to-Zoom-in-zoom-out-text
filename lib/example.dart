import 'package:flutter/material.dart';

class Bubble extends StatefulWidget {
  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  double scale = 0.0;
  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;
  double _savedVal = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector Test'), // changed
      ),
      body: Column(
        children: <Widget>[
          TextButton(
              child: Text('get'),
              onPressed: () {
                _savedVal = _scaleFactor;
              }),
          TextButton(
              child: Text('set'),
              onPressed: () {
                setState(() {
                  _scaleFactor = _savedVal;
                });
              }),
          Expanded(
            child: Center(
                child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onScaleStart: (details) {
                _baseScaleFactor = _scaleFactor;
              },
              onScaleUpdate: (details) {
                setState(() {
                  _scaleFactor = _baseScaleFactor * details.scale;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Test',
                    textScaleFactor: _scaleFactor,
                  ),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
