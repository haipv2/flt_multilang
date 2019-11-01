import 'package:flt_multilanguage/common/app_const.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.ready;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  ViewState get state => _state;
}
