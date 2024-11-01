import 'dart:convert';

import 'package:admin_dashboard/models/http/usuario.dart';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromMap(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toMap());

class AuthResponse {
  Usuario usuario;
  String token;

  AuthResponse({
    required this.usuario,
    required this.token,
  });

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
      };
}
