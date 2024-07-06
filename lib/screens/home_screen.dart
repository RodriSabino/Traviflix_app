import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_travi/screens/screens.dart';

import 'package:flutter_application_travi/widgets/bottomNavigationBar.dart';
import 'package:flutter_application_travi/widgets/sideNavBar/side_menu.dart';

class HomeScreen extends StatefulWidget {
    @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..addListener(() {
      setState(() {});
    });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ),);
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ),);
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9C9BF),
      
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 150),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(),
            ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(animation.value-30*animation.value*pi/180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(isSideMenuClosed ? 0 : 24)),
                  child: MainScreen()))),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: -3,
            left: isSideMenuClosed ? 0 : 220,
            child: MenuBtn(
              onMenuPressed: (isOpen) {
                if(isSideMenuClosed){
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = !isOpen; // Invierte el estado cuando se presiona el botón
                });
              },
            ),
          ),
        ],
      ),
      
      );
  }
}

class MenuBtn extends StatefulWidget {
  final Function(bool) onMenuPressed;

  const MenuBtn({Key? key, required this.onMenuPressed}) : super(key: key);

  @override
  _MenuBtnState createState() => _MenuBtnState();
}

class _MenuBtnState extends State<MenuBtn> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
            widget.onMenuPressed(isOpen);
          });
        },
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 16),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              )
            ],
          ),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 80),
            child: Icon(
              isOpen ? Icons.close : Icons.menu,
              key: ValueKey<bool>(isOpen),)),
          ),
      ),
    );
  }
}
