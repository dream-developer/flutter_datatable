import 'package:flutter/material.dart';
void main() {
  const columns = [ 
    DataColumn( label: Text('商品名'), ),
    DataColumn( label: Text('値段'), ),
  ];

  const rows = [
    DataRow(
      cells: [
        DataCell(Text('アイテム1')),
        DataCell(Text('300')),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text('アイテム2')),
        DataCell(Text('200')),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text('アイテム3')),
        DataCell(Text('100')),
      ],
    ),
  ];

  final datatable = DataTable(
    columns: columns,
    rows: rows, 
  );

  final body = Container( // ボディー
    padding: const EdgeInsets.all(30),
    child: datatable
  ); 

  final sc = Scaffold(
    body: SafeArea(child:body ,), // ボディー    
  );
 
  final app = MaterialApp(home: sc);
  runApp(app);
}