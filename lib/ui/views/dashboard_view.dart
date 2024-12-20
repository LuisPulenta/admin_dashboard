import 'package:admin_dashboard/models/http/usuario.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    Usuario user = authProvider.user!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "DashboardView",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          WhiteCard(
            title: user.nombre,
            child: Text(user.correo),
          ),
        ],
      ),
    );
  }
}
