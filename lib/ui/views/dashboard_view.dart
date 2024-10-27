import 'package:admin_dashboard/models/http/auth_response.dart';
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
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "DashboardView",
            style: CustonLabels.h1,
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
