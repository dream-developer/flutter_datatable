import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // デバッグラベルを消す
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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

  var _isAscending = true; // 1昇順(true)か？のフラグ
  var _currentSortColumn = 0; // 2ソートする列のインデックス

  final List<Map> _data = []; 
    
  _MyHomePageState(){
    for(int i = 1; i <= 5; i++){ 
      _data.add({ 'name': 'アイテム$i', 'price': i * 100 ,
                  'selected': false });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<DataRow> rows = []; 

    _data.asMap().forEach((i, e){ 
      
      if(e['selected']){ 
        print(e['name']);
      }

      final row = DataRow(
        selected: e['selected'],  
          onSelectChanged: (bool? value) { 
            setState(() {
              e['selected'] = value!; 
            });
        },
        cells: [
          DataCell( Text('${e['name']}'), ),
          DataCell( Text('${e['price']}'), ),
        ],
      );
      
      rows.add(row); // リストに追加
    });

    final columns = [ // const → final
      const DataColumn( label: Text('商品名'), ),
      DataColumn(
        label: const Text('値段'),
        onSort: (columnIndex, isAscending) {
          setState(() {
            _currentSortColumn = columnIndex;
            print(columnIndex); // デバッグ用
            
            if (_isAscending == true) { // 昇順 → 降順
              _isAscending = false;

              _data.sort(
                (a, b) => b['price'].compareTo(a['price']),
              );
            } else { // 降順 → 昇順
              _isAscending = true;
              _data.sort((a, b) => a['price'].compareTo(b['price']));
            }
          });
        }
      ),
    ];
    
    final datatable = DataTable(
      sortColumnIndex: _currentSortColumn,
      sortAscending: _isAscending,
      columns: columns,
      rows: rows, 
    );

    final body = Container( // ボディー
      padding: const EdgeInsets.all(30),
      child: datatable
    ); 

    final sc = Scaffold(
      body: body, // ボディー        
    );

    return SafeArea(
      child: sc,
    );
  }
}