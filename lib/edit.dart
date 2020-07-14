import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';

class Edit extends StatefulWidget {
  final int index;
  final String item;

  const Edit({Key key, this.index, this.item}) : super(key: key);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final notify = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: ListView(
          children: <Widget>[
            TextField(
            controller: controller,
            
          ),
          RaisedButton(child: Text("data"),onPressed: (){
              notify.edit(widget.index,controller.text);
          }
          )
          ],  
          )
        ),
      ),
    );
  }
}