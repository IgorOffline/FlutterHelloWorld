import 'package:flutter/material.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int acceptedData = 0;
  double commonSize = 50;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        flex: 5,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Container(
                    color: Color(0xFFD32F2F),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Draggable<int>(
                          // Data is the value this Draggable stores.
                          data: 10,
                          feedback: Container(
                            color: Colors.deepOrange,
                            height: 100,
                            width: 100,
                            child: const Icon(Icons.directions_run),
                          ),
                          child: Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.lightGreenAccent,
                            child: Center(
                              child: WhiteKnight(size: commonSize),
                            ),
                          ),
                        ),
                        DragTarget<int>(
                          builder: (
                            BuildContext context,
                            List<dynamic> accepted,
                            List<dynamic> rejected,
                          ) {
                            return Container(
                              height: 100.0,
                              width: 100.0,
                              color: Colors.cyan,
                              child: Center(
                                child:
                                    Text('Value is updated to: $acceptedData'),
                              ),
                            );
                          },
                          onAccept: (int data) {
                            setState(() {
                              acceptedData += data;
                            });
                          },
                        ),
                      ],
                    ))),
            Expanded(
                flex: 5,
                child: Container(
                  color: Color(0xFF388E3C),
                )),
          ],
        ),
      ),
      Expanded(
        flex: 5,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Container(
                  color: Color(0xFFFBC02D),
                )),
            Expanded(
                flex: 5,
                child: Container(
                  color: Color(0xFF512DA8),
                )),
          ],
        ),
      )
    ]);
  }
}
