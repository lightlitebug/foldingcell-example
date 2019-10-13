import 'package:flutter/material.dart';
import 'dart:math';

import 'package:folding_cell/folding_cell.dart';
import 'package:folding_cell_demo/main_drawer.dart';

class FoldingCellList extends StatefulWidget {
  static final String routeName = '/folding-cell-list-route';

  FoldingCellList({Key key}) : super(key: key);

  _FoldingCellListState createState() => _FoldingCellListState();
}

class _FoldingCellListState extends State<FoldingCellList> {
  List<int> luckyNumbers = List<int>.generate(100, (int index) => 0);

  Widget buildFrontWidget(int index) {
    return Builder(
      builder: (context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.indigo[900], Colors.pink[900]],
          ),
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            setState(() {
              luckyNumbers[index] = Random().nextInt(100);
            });

            SimpleFoldingCellState foldingCellState = context
                .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
            foldingCellState?.toggleFold();
          },
          child: Container(
            child: Transform.rotate(
              angle: -pi / 12.0,
              child: Text(
                'Check Your Luck',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.yellow,
                  fontFamily: 'LeckerliOne',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInnerTopWidget(int index) {
    return Container(
      color: Colors.indigoAccent,
      alignment: Alignment.center,
      child: Container(
        child: Transform.rotate(
          angle: -pi / 12.0,
          child: Text(
            luckyNumbers[index] > 50 ? 'Congraturations!' : 'Woops, next time!',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 36,
              fontFamily: 'LeckerliOne',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInnerBottomWidget(int index) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          SimpleFoldingCellState foldingCellState = context
              .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
          foldingCellState.toggleFold();
        },
        child: Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: Text(
            luckyNumbers[index] < 50
                ? 'U shoot ${luckyNumbers[index]},\n sorry no money!'
                : 'You earn \$${luckyNumbers[index]}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'LeckerliOne',
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Folding Cell List'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, i) {
                  return SimpleFoldingCell(
                    frontWidget: buildFrontWidget(i),
                    innerTopWidget: buildInnerTopWidget(i),
                    innerBottomWidget: buildInnerBottomWidget(i),
                    cellSize: Size(MediaQuery.of(context).size.width, 150),
                    padding: EdgeInsets.all(15),
                    borderRadius: 15,
                    onOpen: () => print('$i Open'),
                    onClose: () => print('$i Close'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
