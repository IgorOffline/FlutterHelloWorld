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
  int sum1 = 0;
  int sum2 = 0;
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
                                child: Draggable<int>(
                                  // Data is the value this Draggable stores.
                                  data: 10,
                                  feedback: Container(
                                    color: Colors.transparent,
                                    height: 100,
                                    width: 100,
                                    child: Icon(Icons.directions_run),
                                  ),
                                  childWhenDragging: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text('Child When Dragging $sum1'),
                                    ),
                                  ),
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text('Draggable $sum1'),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          onAccept: (int data) {
                            setState(() {
                              sum1 += data;
                            });
                          },
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
                                child: Draggable<int>(
                                  // Data is the value this Draggable stores.
                                  data: 10,
                                  feedback: Container(
                                    color: Colors.transparent,
                                    height: 100,
                                    width: 100,
                                    child: Icon(Icons.directions_run),
                                  ),
                                  childWhenDragging: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text('Child When Dragging $sum2'),
                                    ),
                                  ),
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text('Draggable $sum2'),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          onAccept: (int data) {
                            setState(() {
                              sum2 += data;
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
