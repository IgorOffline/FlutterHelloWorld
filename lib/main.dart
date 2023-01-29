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

enum BoardLetter { a, b }

enum BoardNumber { n1 }

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

class BoardProperties {
  double boardWidthHeight;

  BoardProperties(this.boardWidthHeight);
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final boardSize = 8;
  BoardProperties boardProperties = BoardProperties(320);
  BoardSquare a1 =
      BoardSquare(BoardLetter.a, BoardNumber.n1, Piece.king, PieceColor.white);
  BoardSquare b1 =
      BoardSquare(BoardLetter.b, BoardNumber.n1, Piece.king, PieceColor.black);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Container(
            width: boardProperties.boardWidthHeight,
            height: boardProperties.boardWidthHeight,
            margin:
                const EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0)),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: boardSize,
              ),
              itemBuilder: _itemBuilder,
              itemCount: boardSize * boardSize,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Row(children: <Widget>[
            FloatingActionButton(
                onPressed: () => _plus(boardProperties),
                tooltip: '+',
                child: const Icon(Icons.add)),
            FloatingActionButton(
                onPressed: () => _minus(boardProperties),
                tooltip: '-',
                child: const Icon(Icons.remove)),
          ])
        ]));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GridTile(
        child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
    ));
  }

  void _plus(BoardProperties boardProperties) {
    setState(() {
      boardProperties.boardWidthHeight += 11;
    });
    debugPrint('_plus ${boardProperties.boardWidthHeight}');
  }

  void _minus(BoardProperties boardProperties) {
    setState(() {
      boardProperties.boardWidthHeight -= 11;
    });
    debugPrint('_minus ${boardProperties.boardWidthHeight}');
  }
}
