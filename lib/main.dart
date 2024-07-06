import 'package:flutter/material.dart';
import 'package:flutter_application_travi/screens/screens.dart';
import 'package:flutter_application_travi/screens/sideNavBar/screens_menu.dart';

import 'package:flutter_application_travi/widgets/sideNavBar/side_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
      routes: {
        'home':       (BuildContext context) => HomeScreen(),
        'details':    (BuildContext context) => DetailsScreen(),
        'hotel':      (BuildContext context) => HotelScreen(),
        'place':      (BuildContext context) => PlaceScreen(),
        'restaurant': (BuildContext context) => RestaurantScreen(),
        'transport':  (BuildContext context) => TransportScreen(),
        'company':    (BuildContext context) => CompanyScreen(),
        'favorites':  (BuildContext context) => FavoritiesScreen(),
        'profile':    (BuildContext context) => ProfileScreen(),
        'discounts':  (BuildContext context) => DiscountScreen(),
        'notifications': (BuildContext context) => NotificationScreen(),
        'clasification': (BuildContext context) => ClasificationScreen(),


      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme( // Cambia el color de la sombra
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
