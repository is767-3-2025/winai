import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _username = '';
  
  get username => this._username;

  set username(value) {
    this._username = value;
    notifyListeners();
  }
}