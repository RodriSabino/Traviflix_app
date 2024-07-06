import 'package:flutter/material.dart';
import 'package:flutter_application_travi/widgets/bottomNavigationBar.dart';

class PlaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Places",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
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
