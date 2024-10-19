import 'package:admin_dashboard/ui/layouts/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(text: 'main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            isActive: false,
            onPressed: () => print('Dashboard'),
          ),
          MenuItem(
            text: 'Usuario',
            icon: Icons.person,
            isActive: false,
            onPressed: () => print('Usuario'),
          ),
          MenuItem(
            text: 'Configuración',
            icon: Icons.settings,
            isActive: false,
            onPressed: () => print('Configuración'),
          ),
        ],
      ),
    );
  }

//--------------------------------------------------------------
  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff092044),
            Color.fromARGB(255, 1, 108, 122),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ]);
  }
}
