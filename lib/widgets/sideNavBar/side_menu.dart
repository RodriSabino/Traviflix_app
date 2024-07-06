import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_travi/widgets/sideNavBar/info_card.dart';
import 'package:flutter_application_travi/widgets/sideNavBar/side_menu_tile.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFFD9C9BF),
        child: SafeArea(
          child: Column(
            children: [
              InfoCard(
                name: "Antonio Botella",
                profession: "@antbotella",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text("Browse".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SideMenuTile(
                      name: menuItems[index].name,
                      icon: menuItems[index].icon,
                      routeName: menuItems[index].routeName,
                      onTap: () {
                        Navigator.pushNamed(context, menuItems[index].routeName); // Aquí maneja la navegación según el ítem del menú seleccionado
                        // Aquí maneja la navegación según el ítem del menú seleccionado
                        // Puedes utilizar Navigator como lo hiciste antes
                        isActive: true;
                      },
                      isActive: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class MenuData {
  final String name;
  final IconData icon;
  final String routeName;

  MenuData({required this.name, required this.icon, required this.routeName});
}

List<MenuData> menuItems = [
  MenuData(name: 'Profile', icon: CupertinoIcons.person_fill, routeName: 'profile'),
  MenuData(name: 'Clasification', icon: CupertinoIcons.bars, routeName: 'clasification'),
  MenuData(name: 'Favorites', icon: CupertinoIcons.heart_fill, routeName: 'favorites'),
  MenuData(name: 'Notifications', icon: CupertinoIcons.bell_fill, routeName: 'notifications'),
  MenuData(name: 'Discounts', icon: CupertinoIcons.tag_fill, routeName: 'discounts'),
  MenuData(name: 'Log out', icon: CupertinoIcons.arrow_left_circle, routeName: 'login'),

  // Añade el resto de elementos de menú
];