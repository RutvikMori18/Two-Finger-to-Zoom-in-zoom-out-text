import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> data = [];
TextEditingController textDataController = TextEditingController();

Offset initialPosition = const Offset(200, 200);
double lastPosition = 1;
double currentPosition = 1;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void updateScale(double zoom) {
      setState(() {
        currentPosition = lastPosition * zoom;
      });
    }

    void commitScale() {
      setState(() {
        lastPosition = currentPosition;
      });
    }

    void updatePosition(Offset newPosition) {
      setState(() {
        initialPosition = newPosition;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onScaleUpdate: (details) => updateScale(details.scale),
            onScaleEnd: (_) => commitScale(),
            child: Stack(
              children: [
                //FOR BACK GROUND
                Positioned.fill(child: Image.asset('assets/bg.jpg')),
                //FOR TEXT
                for (int i = 0; i < data.length; i++)
                  Positioned(
                    left: initialPosition.dx,
                    top: initialPosition.dy,
                    child: Draggable(
                      feedback: Container(),
                      onDragEnd: (details) {
                        updatePosition(details.offset);
                      },
                      child: Transform.scale(
                        scale: currentPosition,
                        child: Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                          ),
                          child: Text(
                            data[i],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: customDialogBox,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future customDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Input Text..."),
          content: TextField(
            controller: textDataController,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.done,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                if (textDataController.text.isNotEmpty) {
                  data.add(textDataController.text);
                  textDataController.clear();
                  Navigator.of(context).pop();
                  setState(() {});
                }
              },
            ),
          ],
        );
      },
    );
  }
}
