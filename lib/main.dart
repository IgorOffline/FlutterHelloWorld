import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart' as sql;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _databaseLogic() {
    setState(() {
      if (_counter == 0) {
        print('Using sqlite3 ${sql.sqlite3.version}');
        final db = sql.sqlite3.open('second.sqlite3');
        final sql.ResultSet resultSet = db.select('SELECT h.id_hello id, h.name FROM hello h');

        for (final sql.Row row in resultSet) {
          print('Second[id: ${row['id']}, name: ${row['name']}]');
        }

        db.dispose();

        _counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _databaseLogic,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
