import 'package:flutter/material.dart';
import 'package:tcc_sla_project/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(String nome, String rm, String email, String password) {
    _user = User(
      name: nome,
      rm: rm,
      email: email,
      senha: password,
    );
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
