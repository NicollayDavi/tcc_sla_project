import 'package:flutter/material.dart';
import 'package:tcc_sla_project/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(String name, String rm, String email) {
    _user = User(name: name, rm: rm, email: email);
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}