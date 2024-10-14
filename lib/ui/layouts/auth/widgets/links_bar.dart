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
            onPressed: () => {
              //print('About')
            },
          ),
          const LinkText(text: 'Help Center'),
          const LinkText(text: 'Terms of Aervice'),
          const LinkText(text: 'Privacy Policy'),
          const LinkText(text: 'Cooky Policy'),
          const LinkText(text: 'Ads Info'),
          const LinkText(text: 'Blog'),
          const LinkText(text: 'Status'),
          const LinkText(text: 'Careers'),
          const LinkText(text: 'Brand Resources'),
          const LinkText(text: 'Advertising'),
          const LinkText(text: 'Marketing'),
        ],
      ),
    );
  }
}
