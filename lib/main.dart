import 'package:flutter/material.dart';
void main() {
  const columns = [ 
    //DataColumn( label: Text('商品名'), ),
    DataColumn(
      label: SizedBox(
        width: 2000, // 横スクロール検証用
        child: Text('商品名'),
      )
    ),
    DataColumn( label: Text('値段'), ),
  ];
    
  final List<DataRow> rows = [];

  for(int i = 1; i <= 100; i++){
    rows.add(
      DataRow(
        cells: [
          DataCell(Text('アイテム$i')),
          DataCell(Text('${i * 100}')),
        ],
      )
    );
  }

  final datatable = DataTable(
    columns: columns,
    rows: rows, 
  );

  final body = Container( // ボディー
    padding: const EdgeInsets.all(30),
    child: ListView( // 縦スクロール
      children: [
        SingleChildScrollView( // 横スクロール
          scrollDirection: Axis.horizontal,
          child: datatable,
        )
      ]
    ),
  );  

  final sc = Scaffold(
    body: SafeArea(child:body ,), // ボディー    
  );
 
  final app = MaterialApp(home: sc);
  runApp(app);
}