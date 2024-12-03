import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Icons",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: "ac_unit_outlined",
                width: 170,
                child: Center(child: Icon(Icons.ac_unit_outlined)),
              ),
              WhiteCard(
                title: "abc_outlined",
                width: 170,
                child: Center(child: Icon(Icons.abc_outlined)),
              ),
              WhiteCard(
                title: "access_alarm_outlined",
                width: 170,
                child: Center(child: Icon(Icons.access_alarm_outlined)),
              ),
              WhiteCard(
                title: "home_outlined",
                width: 170,
                child: Center(child: Icon(Icons.home_outlined)),
              ),
              WhiteCard(
                title: "person_outline",
                width: 170,
                child: Center(child: Icon(Icons.person_outline)),
              ),
              WhiteCard(
                title: "settings_outlined",
                width: 170,
                child: Center(child: Icon(Icons.settings_outlined)),
              ),
              WhiteCard(
                title: "watch_later_outlined",
                width: 170,
                child: Center(child: Icon(Icons.watch_later_outlined)),
              ),
              WhiteCard(
                title: "car_rental_outlined",
                width: 170,
                child: Center(child: Icon(Icons.car_rental_outlined)),
              ),
              WhiteCard(
                title: "mouse_outlined",
                width: 170,
                child: Center(child: Icon(Icons.mouse_outlined)),
              ),
              WhiteCard(
                title: "mode_comment_outlined",
                width: 170,
                child: Center(child: Icon(Icons.mode_comment_outlined)),
              ),
              WhiteCard(
                title: "wifi",
                width: 170,
                child: Center(child: Icon(Icons.wifi)),
              ),
              WhiteCard(
                title: "animation_outlined",
                width: 170,
                child: Center(child: Icon(Icons.animation_outlined)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
