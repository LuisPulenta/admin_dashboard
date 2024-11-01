import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  final List<Usuario> users;
  final BuildContext context;

  UsersDTS(this.users, this.context);
  @override
  DataRow getRow(int index) {
    final Usuario user = users[index];

    const image = Image(
      image: AssetImage('no-image.jpg'),
      width: 35,
      height: 35,
    );
    return DataRow.byIndex(
      index: index,
      cells: [
        const DataCell(
          ClipOval(
            child: image,
          ),
        ),
        DataCell(
          Text(user.nombre),
        ),
        DataCell(
          Text(user.correo),
        ),
        DataCell(
          Text(user.uid),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, color: Colors.orange),
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
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
