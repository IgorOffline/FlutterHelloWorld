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

enum BoardLetter {
  a("A"),
  b("B"),
  c("C"),
  d("D"),
  e("E"),
  f("F"),
  g("G"),
  h("H");

  const BoardLetter(this.name);

  final String name;

  @override
  String toString() {
    return name;
  }
}

enum BoardNumber {
  n1("1"),
  n2("2"),
  n3("3"),
  n4("4"),
  n5("5"),
  n6("6"),
  n7("7"),
  n8("8");

  const BoardNumber(this.name);

  final String name;

  @override
  String toString() {
    return name;
  }
}

enum Piece { none, king, rook }

enum PieceColor { none, white, black }

class BoardSquare {
  BoardLetter letter;
  BoardNumber number;
  Piece piece;
  PieceColor pieceColor;

  BoardSquare(this.letter, this.number, this.piece, this.pieceColor);
}

Widget getWidgetForSquare(BoardSquare square) {
  if (square.pieceColor == PieceColor.white) {
    if (square.piece == Piece.king) {
      return WhiteKing();
    }
  } else if (square.pieceColor == PieceColor.black) {
    if (square.piece == Piece.king) {
      return BlackKing();
    }
  }

  return BlackKnight();
}

class Board {
  int size = 8;
  double widthHeight = 441;
  List<BoardSquare> squares = [];

  Board() {
    for (var j = 0; j < size; j++) {
      for (var i = 0; i < size; i++) {
        final letter = BoardLetter.values.elementAt(i);
        final number = BoardNumber.values.reversed.elementAt(j);
        squares.add(BoardSquare(letter, number, Piece.none, PieceColor.none));
      }
    }
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Board board = Board();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Container(
            width: board.widthHeight,
            height: board.widthHeight,
            margin:
                const EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0)),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: board.size,
              ),
              itemBuilder: (context, index) =>
                  _itemBuilder(context, index, board),
              itemCount: board.size * board.size,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Row(children: <Widget>[
            FloatingActionButton(
                onPressed: () => _plus(board),
                tooltip: '+',
                child: const Icon(Icons.add)),
            FloatingActionButton(
                onPressed: () => _minus(board),
                tooltip: '-',
                child: const Icon(Icons.remove)),
          ])
        ]));
  }

  Widget _itemBuilder(BuildContext context, int index, Board board) {
    return GridTile(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5)),
            child: Text(
                '${board.squares.elementAt(index).letter}${board.squares.elementAt(index).number}')));
  }

  void _plus(Board board) {
    setState(() {
      board.widthHeight += 11;
    });
    debugPrint('_plus ${board.widthHeight}');
  }

  void _minus(Board board) {
    setState(() {
      board.widthHeight -= 11;
    });
    debugPrint('_minus ${board.widthHeight}');
  }
}
