import 'package:flutter/material.dart';

class UserPreferenceModel extends ChangeNotifier {
  bool _isMember = false;
  bool _isAllYouCanEat = false;
  int _noodleType = 0;
  String _chooseCard = '';
  String _chooseCard2 = '';

  get isMember => this._isMember;
  set isMember( value) {
    this._isMember = value;
    notifyListeners();
  }

  get isAllYouCanEat => this._isAllYouCanEat;
  set isAllYouCanEat( value) {
    this._isAllYouCanEat = value;
    notifyListeners();
  }

  get noodleType => this._noodleType;
  set noodleType( value) {
    this._noodleType = value;
    notifyListeners();
  }

  get chooseCard => this._chooseCard;
  set chooseCard( value) {
    this._chooseCard = value;
    notifyListeners();
  }

  get chooseCard2 => this._chooseCard2;
  set chooseCard2( value) {
    this._chooseCard2 = value;
    notifyListeners();
  }
}