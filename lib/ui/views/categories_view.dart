import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

//-----------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

//-----------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    List<Categoria> categorias =
        Provider.of<CategoriesProvider>(context).categories;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Categories",
            style: CustomLabels.h1,
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
            source: CategoriesDTS(categorias, context),
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
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => const CategoryModal(
                      categoria: null,
                    ),
                  );
                },
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
