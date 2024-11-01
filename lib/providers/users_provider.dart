import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;

  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final userResp = UsersResponse.fromJson(resp);
    users = [...userResp.usuarios];

    isLoading = false;
    notifyListeners();
  }
}
