import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/layouts/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigationServices.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    //final sideMenuProvider =Provider.of<SideMenuProvider>(context, listen: true);

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
          const TextSeparator(text: 'Main'),
          MenuItem(
            text: 'DashboardX',
            icon: Icons.compass_calibration_outlined,
            isActive: true,
            //sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(
              text: 'Orders',
              icon: Icons.shopping_cart_outlined,
              isActive: false,
              onPressed: () {
                print('Orders');
                SideMenuProvider.closeMenu();
              }),
          MenuItem(
              text: 'Analytic',
              icon: Icons.show_chart_outlined,
              isActive: false,
              onPressed: () {
                print('Analytic');
                SideMenuProvider.closeMenu();
              }),
          MenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive: false,
            onPressed: () => print('Categories'),
          ),
          MenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            isActive: false,
            onPressed: () => print('Products'),
          ),
          MenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            isActive: false,
            onPressed: () => print('Discount'),
          ),
          MenuItem(
            text: 'Customers',
            icon: Icons.people_outline_outlined,
            isActive: false,
            onPressed: () => print('Customers'),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            isActive: true,
            //sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            isActive: false,
            onPressed: () => print('Categories'),
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            isActive: false,
            onPressed: () => print('Products'),
          ),
          MenuItem(
            text: 'Black',
            icon: Icons.post_add_outlined,
            isActive: false,
            onPressed: () => print('Products'),
          ),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(text: 'Exit'),
          MenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            isActive: false,
            onPressed: () => print('Discount'),
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
