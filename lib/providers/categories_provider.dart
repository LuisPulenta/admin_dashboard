import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:admin_dashboard/models/http/category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

//--------------------------------------------------------------------
  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromJson(resp);

    categories = [...categoriesResp.categorias];

    notifyListeners();
  }

//--------------------------------------------------------------------
  Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final resp = await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromJson(resp);

      categories.add(newCategory);
      notifyListeners();
    } catch (e) {
      throw ('Error al crear Categoría');
    }
  }

//--------------------------------------------------------------------
  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};

    try {
      await CafeApi.put('/categorias/$id', data);
      categories = categories.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw ('Error al guardar la Categoría');
    }
  }

  //--------------------------------------------------------------------
  Future deleteCategory(String id) async {
    try {
      await CafeApi.delete('/categorias/$id', {});

      categories.removeWhere((category) => category.id == id);

      notifyListeners();
    } catch (e) {
      throw ('Error al borrar la Categoría');
    }
  }
}
