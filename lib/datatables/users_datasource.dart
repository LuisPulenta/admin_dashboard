import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  final List<Usuario> users;
  final BuildContext context;

  UsersDTS(this.users, this.context);
  @override
  DataRow getRow(int index) {
    final Usuario user = users[index];

    final image = (user.img == null)
        ? const Image(
            image: AssetImage('no-image.jpg'),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif',
            image: user.img!,
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          ClipOval(child: image),
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
                onPressed: () {
                  NavigationServices.replaceTo('/dashboard/users/${user.uid}');
                },
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
