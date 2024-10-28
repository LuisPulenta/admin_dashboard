import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Categories",
            style: CustonLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("Categoría")),
              DataColumn(label: Text("Creado por")),
              DataColumn(label: Text("Acciones")),
            ],
            source: CategoriesDTS(),
            header: const Text(
              "Esta es la Lista de todas las Categorías disponibles",
              maxLines: 2,
            ),
            rowsPerPage: _rowsPerPage,
            onRowsPerPageChanged: (value) {
              _rowsPerPage = value ?? 10;
              setState(() {});
            },
            actions: [
              CustomIconButton(
                icon: Icons.add_outlined,
                text: "Nueva Categoría",
                onPressed: () {},
              ),
              CustomIconButton(
                icon: Icons.car_crash,
                text: "Botón 2",
                onPressed: () {},
                color: Colors.red,
              ),
              CustomIconButton(
                  icon: Icons.alarm,
                  text: "Botón 3",
                  onPressed: () {},
                  color: Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}
