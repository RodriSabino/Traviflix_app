import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_travi/screens/screens.dart';
import 'package:flutter_application_travi/screens/sideNavBar/screens_menu.dart';

class SideMenuTile extends StatefulWidget {
  final String? name;
  final IconData? icon;
  final String? routeName;
  final VoidCallback? onTap;
  final bool isActive;

  const SideMenuTile({
    required this.name,
    required this.icon,
    required this.routeName,
    required this.onTap,
    required this.isActive,
  });

  @override
  _SideMenuTileState createState() => _SideMenuTileState();
}

class _SideMenuTileState extends State<SideMenuTile> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white30,
            height: 0.4,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isActive = !_isActive;
            });
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                height: 56,
                width: _isActive ? 288 : 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 270,
                margin: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                padding: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white, // Cambia el color a negro
                      blurRadius:
                          0, // Cambia el radio de desenfoque según lo desees
                      offset: Offset(0,
                          3), // Cambia la posición de la sombra // changes the position of the shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        //_isActive = !_isActive;
                      });
                      if (widget.onTap != null) {
                        widget.onTap!();
                      }
                    },
                    leading: SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(
                        widget.icon,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      widget.name!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
