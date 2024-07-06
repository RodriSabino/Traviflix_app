import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<String> routeNames;
  final List<IconData> icons;

  const CustomBottomNavigationBar({
    Key? key,
    required this.routeNames,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, routeNames[index]);
              },
              child: SizedBox(
                width: 36,
                height: 36,
                child: Icon(icons[index], color: Colors.black45),
              ),
            ),
          ),
        ),
      ),
    );
  }
}