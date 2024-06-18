import 'package:flutter/material.dart';

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
        body: const FirstRoute(firstCounterInit: 0),
      ),
    );
  }
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key, required this.firstCounterInit});

  final int firstCounterInit;

  @override
  State<FirstRoute> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<FirstRoute> {
  late int firstCounter;

  @override
  void initState() {
    firstCounter = widget.firstCounterInit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Route'),
        ),
        body: Center(
          child: Row(children: [
            ElevatedButton(
                onPressed: () async {
                  final retVal = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SecondRoute(secondCounterInit: firstCounter)));
                  setState(() {
                    firstCounter = retVal;
                  });
                },
                child: const Text('Open route')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    ++firstCounter;
                  });
                },
                child: Text('$firstCounter'))
          ]),
        ));
  }
}

class SecondRoute extends StatefulWidget {
  SecondRoute({super.key, required this.secondCounterInit});

  final int secondCounterInit;

  @override
  State<SecondRoute> createState() => _SecondStatefulWidgetState();
}

class _SecondStatefulWidgetState extends State<SecondRoute> {
  late int secondCounter;

  @override
  void initState() {
    secondCounter = widget.secondCounterInit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: Center(
          child: Row(children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, secondCounter);
                },
                child: const Text('Go back')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    ++secondCounter;
                  });
                },
                child: Text('$secondCounter'))
          ]),
        ));
  }
}
