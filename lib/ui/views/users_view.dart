import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "UsersView",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text("Avatar")),
              DataColumn(label: Text("Nombre")),
              DataColumn(label: Text("Email")),
              DataColumn(label: Text("UID")),
              DataColumn(label: Text("Acciones")),
            ],
            source: UsersDTS(usersProvider.users, context),
            header: const Text(
              "Esta es la Lista de todos los Usuarios",
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
                text: "Nuevo Usuario",
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
