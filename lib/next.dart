import 'package:flutter/material.dart';

import 'edit.dart';
import 'controller.dart';
import 'model.dart';

class Source extends DataTableSource{
final Controller controller = Controller();
 final BuildContext context;
 final List<Data> list;
  Source(this.context,this.list);
  notifyListeners();
  @override
  DataRow getRow(int index) {
   final String item = list[index].data;
   return DataRow.byIndex(
      selected: list[index].selected,
      onSelectChanged: (selected) {
      list[index].selected  = selected;
      notifyListeners();
    },
     index: index,
     cells: [
       DataCell(Text('$item')),
       DataCell(IconButton(icon: Icon(Icons.delete), onPressed: ()async{
         print("heello");
        list.removeAt(index);
        notifyListeners();
       })),
       DataCell(IconButton(icon: Icon(Icons.edit), onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(_)=> Edit(
          item : item,index : index
        )));
       })),
     ]
   );
    
  }

  @override
  
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;

}

