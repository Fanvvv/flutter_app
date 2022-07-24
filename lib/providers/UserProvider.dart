import 'dart:convert';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  bool _isLogin = false;
  Map _user = {};

  bool get isLogin => _isLogin;
  Map get user => _user;

  doLogin(data) {
    if (data != false) {
      _isLogin = true;
      _user = json.decode(data);

      notifyListeners();
    }
  }

  doLogout() {
    _isLogin = false;
    _user = {};

    notifyListeners();
  }
}