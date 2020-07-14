import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/next.dart';
import 'add.dart';
import 'controller.dart';
import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    Controller control = Controller();
  @override
  void initState() { 
    super.initState();
    setState(() {
      control.adddata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Controller>(create: (_)=> Controller(),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<int> add = <int>[];
 int _sortColumnIndex = 0;
  bool _sortAscending = true;
  bool isSearch = false;
  TextEditingController controller = TextEditingController();
  var _rowsPerPage =5;
  @override
  Widget build(BuildContext context) {
    final cc = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Add()));
          }),
          IconButton(icon: Icon(Icons.delete), onPressed: (){
           for (var i = 0; i < cc.list.length -1 ; i++) {
             if(cc.list[i].selected){
              //  cc.remove(i);
              //  add.add(i);
              setState(() {
                cc.list.removeAt(i);
                //  cc.list.remove(Data(data:cc.list[i].data,selected:true));
                  // cc.list.remove(',');
              });
              // print(i);
              // print(add.length);
             }
           }
          })
        ],
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          dataRowHeight: 50,
          showCheckboxColumn: true,
          onPageChanged: (v){
            print(v);
          },
          // initialFirstRowIndex: 1,
          // horizontalMargin: 65,
          // columnSpacing: 100,
          header: Text("data"),
          actions: <Widget>[
            isSearch ?Container(
                                 width: 100,
                                 child: TextField(
                              
                controller: controller,
                onChanged:cc.search,
              ),
                               ) : Container(),
           isSearch ? IconButton(icon: Icon(Icons.cancel), onPressed: (){
                setState(() {
                  isSearch = !isSearch;
                  controller.clear();
                  cc.search("");
                });
            }) : IconButton(icon: Icon(Icons.search), onPressed: (){
                setState(() {
                  isSearch = !isSearch;
                });
            })
          ],
                  rowsPerPage: _rowsPerPage,
          availableRowsPerPage: [5,10],
          sortAscending: _sortAscending,
          sortColumnIndex: _sortColumnIndex,
         onSelectAll: (v){
           setState(() {
      cc.list.forEach((f){
        f.selected = v;
      });
    });
         },
          headingRowHeight: 30.0,
          onRowsPerPageChanged: (int v) {
            setState(() {
              _rowsPerPage = v;
            });
          },
          
        columns: [
          DataColumn(label: Text("data"),       onSort: (index, sortAscending) {
            setState(() {
              _sortAscending = sortAscending;
              if (sortAscending) {
                cc.lists.sort((a, b) => a.data.compareTo(b.data));
              } else {
                cc.lists.sort((a, b) => b.data.compareTo(a.data));
              }
            });
          }),
           DataColumn(label: Text("delete")),
           DataColumn(label: Text("edit"))
        ], source: Source(context,cc.lists)),
      ), 
    );
  }
}
