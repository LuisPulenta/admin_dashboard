import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final String uid;
  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "UserView",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          WhiteCard(
            title: "Usuario",
            child: Text(uid),
          ),
        ],
      ),
    );
  }
}
