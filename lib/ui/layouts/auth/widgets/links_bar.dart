import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.width > 1000 ? size.height * 0.08 : null,
      color: Colors.black,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'About',
            onPressed: () => {print('About')},
          ),
          LinkText(text: 'Help Center'),
          LinkText(text: 'Terms of Aervice'),
          LinkText(text: 'Privacy Policy'),
          LinkText(text: 'Cooky Policy'),
          LinkText(text: 'Ads Info'),
          LinkText(text: 'Blog'),
          LinkText(text: 'Status'),
          LinkText(text: 'Careers'),
          LinkText(text: 'Brand Resources'),
          LinkText(text: 'Advertising'),
          LinkText(text: 'Marketing'),
        ],
      ),
    );
  }
}
