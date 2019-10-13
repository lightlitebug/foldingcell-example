import 'package:flutter/material.dart';

import 'package:folding_cell_demo/single_folding_cell.dart';
import 'package:folding_cell_demo/folding_cell_list.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                'Folding Cell',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                SingleFoldingCell.routeName,
              );
            },
            leading: Icon(
              Icons.looks_one,
              color: Colors.blue[900],
              size: 24,
            ),
            title: Text('Single Folding Cell'),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                FoldingCellList.routeName,
              );
            },
            leading: Icon(
              Icons.format_list_numbered,
              color: Colors.blue[900],
              size: 24,
            ),
            title: Text('Folding Cell List'),
          )
        ],
      ),
    );
  }
}
