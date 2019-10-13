import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'dart:math';

import 'package:folding_cell_demo/main_drawer.dart';

class SingleFoldingCell extends StatefulWidget {
  static final String routeName = '/';

  SingleFoldingCell({Key key}) : super(key: key);

  _SingleFoldingCellState createState() => _SingleFoldingCellState();
}

class _SingleFoldingCellState extends State<SingleFoldingCell> {
  // final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  int luckyNumber = 0;

  Widget buildFrontWidget() {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          setState(() {
            luckyNumber = Random().nextInt(100);
          });
          SimpleFoldingCellState foldingCellState = context
              .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
          foldingCellState.toggleFold();
          // _foldingCellKey.currentState.toggleFold();
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.indigo[900], Colors.pink[900]],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            'Check Your Luck!',
            style: TextStyle(
              fontSize: 36,
              color: Colors.yellow,
              fontFamily: 'LeckerliOne',
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInnerTopWidget() {
    return Container(
      color: Colors.indigoAccent,
      alignment: Alignment.center,
      child: Container(
        child: Transform.rotate(
          angle: -pi / 12,
          child: Text(
            luckyNumber > 50 ? 'Congraturations!' : 'Woops, next time!',
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

  Widget buildInnerBottomWidget() {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          // _foldingCellKey.currentState.toggleFold();
          SimpleFoldingCellState foldingCellState = context
              .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
          foldingCellState.toggleFold();
        },
        child: Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: Text(
            luckyNumber > 50
                ? 'You earn \$$luckyNumber'
                : 'U shoot $luckyNumber,\n Sorry no money!',
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
        title: Text('Single Folding Cell'),
      ),
      body: Center(
        child: SimpleFoldingCell(
          // key: _foldingCellKey,
          frontWidget: buildFrontWidget(),
          innerBottomWidget: buildInnerBottomWidget(),
          innerTopWidget: buildInnerTopWidget(),
          cellSize: Size(MediaQuery.of(context).size.width, 150),
          padding: EdgeInsets.all(15),
          borderRadius: 15,
          onOpen: () => print('Open!'),
          onClose: () => print('Close!'),
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
