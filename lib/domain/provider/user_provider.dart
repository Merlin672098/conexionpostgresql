import 'package:flutter/material.dart';
import '../entities/usuario.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    type: '',
    token: '',
    modoOscuro: false,
    verificacion: false,
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      type: '',
      token: '',
      modoOscuro: false,
      verificacion: false,
    );
    notifyListeners();
  }

  static final UserProvider _instance = UserProvider._internal();

  UserProvider._internal();

  factory UserProvider() {
    return _instance;
  }

  get instance => this;

  String _userId = '';

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  String getUserId() {
    print('Llamando a getUserId() en UserProvider');
    print('ID del usuario: $_userId');
    return _userId;
  }
}
