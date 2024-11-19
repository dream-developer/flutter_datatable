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
  final List<Map> _data = []; // 1
    
  _MyHomePageState(){
    for(int i = 1; i <= 5; i++){ // 2
      _data.add({ 'name': 'アイテム$i', 'price': i * 100 ,
                  'selected': false });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<DataRow> rows = []; // 3

    _data.asMap().forEach((i, e){ // 4
      
      if(e['selected']){ // 5
        print(e['name']);
      }

      final row = DataRow(
        selected: e['selected'],  // 6
          onSelectChanged: (bool? value) { // 7
            setState(() {
              e['selected'] = value!; // 8
            });
        },
        cells: [
          DataCell( Text('${e['name']}'), ),
          DataCell( Text('${e['price']}'), ),
        ],
      );
      
      rows.add(row); // リストに追加
    });

    const columns = [ 
      DataColumn( label: Text('商品名'), ),
      DataColumn( label: Text('値段'), ),
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
      body: body, // ボディー        
    );

    return SafeArea(
      child: sc,
    );
  }
}