import 'package:flutter/material.dart';

import 'model.dart';

class Controller extends ChangeNotifier {
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }
  static Controller _this;
  Controller._() : super();
  List<Data> get lists => show;
  List<Data> list = [
    Data(data: "a"),
    Data(data: "b"),
    Data(data: "c"),
    Data(data: "d"),
    Data(data: "e"),
    Data(data: "f"),
    Data(data: "g"),
    Data(data: "h"),
    Data(data: "i"),
    Data(data: "j"),
    Data(data: "k"),
  ];
  List<Data> show = <Data>[];
  void adddata() {
    show = list;
    notifyListeners();
  }

  void edit(int index, String item) {
    list.replaceRange(index, index + 1, [Data(data: item)]);
    notifyListeners();
  }

  void add(String item) {
    list.add(Data(data: item));
    notifyListeners();
  }

void remove(int i){
  list.removeAt(i);
  notifyListeners();
}
  void search(String value) {
    if (value.isNotEmpty || value.length != 0) {
      show = list.where((v) {
        var data = v.data.toLowerCase();

        return data.contains(value.toLowerCase());
      }).toList();
      notifyListeners();
    } else {
      show = list;
      notifyListeners();
    }
  }
}
