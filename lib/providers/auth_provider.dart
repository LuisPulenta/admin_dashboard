import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    //TODO: Petición HTTP
    _token = 'abcdefgh12345678';
    LocalStorage.prefs.setString('token', _token!);

    print(LocalStorage.prefs.getString('token'));

    //TODO: Navegar al Dashboard
    notifyListeners();
  }
}
