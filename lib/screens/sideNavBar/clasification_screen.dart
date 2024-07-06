import 'package:flutter/material.dart';
import 'package:flutter_application_travi/widgets/bottomNavigationBar.dart';

class ClasificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Traviflix' ),
        
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        routeNames: [
          'home',
          'place',
          'restaurant',
          'hotel',
          'transport',
          'company',
        ],
        icons: [
          Icons.home,
          Icons.place,
          Icons.restaurant,
          Icons.hotel,
          Icons.bus_alert,
          Icons.business,
        ],
      ),
      );
  }
}