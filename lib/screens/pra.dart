import 'package:flutter/material.dart';
import 'package:practice/save/list_add.dart';
import 'package:practice/screens/add_roulette_screen.dart';

class AddProvider with ChangeNotifier {
  void add() {
    itemsList.add(
      Item.create(""),
    );
    notifyListeners();
  }
}
