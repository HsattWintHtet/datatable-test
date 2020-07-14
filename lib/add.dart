import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    final notify = Provider.of<Controller>(context);
    TextEditingController controller = TextEditingController();
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
              notify.add(controller.text);
          }
          )
          ],  
          )
        ),
      )
    );
  }
}