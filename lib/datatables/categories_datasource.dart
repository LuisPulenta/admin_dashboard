import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);
  @override
  DataRow getRow(int index) {
    final categoria = categorias[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text(categoria.id),
        ),
        DataCell(
          Text(categoria.nombre),
        ),
        DataCell(
          Text(categoria.usuario.nombre),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(
                      categoria: categoria,
                    ),
                  );
                },
                icon: const Icon(Icons.edit_outlined, color: Colors.orange),
              ),
              IconButton(
                onPressed: () {
                  final dialog = AlertDialog(
                    title: const Text("Atención!!"),
                    content: Text(
                        "Está seguro de borrar la categoría ${categoria.nombre}?"),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context,
                                  listen: false)
                              .deleteCategory(categoria.id);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Si"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("No"),
                      ),
                    ],
                  );
                  showDialog(context: context, builder: (_) => dialog);
                },
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
