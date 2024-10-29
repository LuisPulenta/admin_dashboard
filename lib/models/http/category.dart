class Categoria {
  String id;
  String nombre;
  CategoriaUsuario usuario;

  Categoria({
    required this.id,
    required this.nombre,
    required this.usuario,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: CategoriaUsuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toJson(),
      };
}

class CategoriaUsuario {
  String id;
  String nombre;

  CategoriaUsuario({
    required this.id,
    required this.nombre,
  });

  factory CategoriaUsuario.fromJson(Map<String, dynamic> json) =>
      CategoriaUsuario(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
      };
}
