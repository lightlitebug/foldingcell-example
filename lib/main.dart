import 'package:flutter/material.dart';

import 'package:folding_cell_demo/single_folding_cell.dart';
import 'package:folding_cell_demo/folding_cell_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folding Cell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SingleFoldingCell(),
      routes: {
        FoldingCellList.routeName: (context) => FoldingCellList(),
      },
    );
  }
}
