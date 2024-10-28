import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('Cell # index: $index')),
        DataCell(Text('Cell # index: $index')),
        DataCell(Text('Cell # index: $index')),
        DataCell(Text('Cell # index: $index')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
