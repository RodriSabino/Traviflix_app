import 'package:flutter/material.dart';
import 'package:flutter_application_travi/widgets/bottomNavigationBar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text( 'Traviflix' ),
      //),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Traviflix",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 25, bottom: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Places ",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...places
                        .map((place) => Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: PlaceCard(place: place),
                            ))
                        .toList(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 25, bottom: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recent",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
              ...recentPlaces.map(
                (recent) =>Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: RecentCard(recent: recent,),
                )
              )
              //Padding(
              //  padding: const EdgeInsets.all(8.0),
              //  child: Align(
              //    alignment: Alignment.centerLeft,
              //    child: ...places.map((place)=>PlaceCard(place: place)).toList()),
              //  ),
            ],
          ),
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

class RecentCard extends StatelessWidget {
  const RecentCard({
    super.key,
    required this.recent,
  });

  final Recent recent;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  recent.name,
                  style:
                      Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                ),
                SizedBox(height: 5),
                Text(
                  recent.location,
                  style:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.favorite_border,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}


class Recent {
  final String name, location, likes;
  final Image placeImage;

  Recent({
    required this.name,
    required this.location,
    required this.likes,
    required this.placeImage,
  });
}

List<Recent> recentPlaces = [
  Recent(
    name: "Playa La Mina",
    location: "Paracas, Ica",
    likes: "2036",
    placeImage: Image.asset('assets/images/1.jpg'),
  ),
  Recent(
    name: "Macchu Picchu",
    location: "Cusco, Cusco",
    likes: "5306",
    placeImage: Image.asset('assets/images/2.jpg'),
  ),
  Recent(
    name: "Laguna 69",
    location: "Huaraz, Ancash",
    likes: "2036",
    placeImage: Image.asset('assets/images/3.jpg'),
  ),
  Recent(
    name: "Laguna Parón",
    location: "Huaraz, Ancash",
    likes: "2036",
    placeImage: Image.asset('assets/images/4.jpg'),
  ),
];
class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.place,
  });

  final Place place;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 250,
      width: 230,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/1.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 8, // Desplazamiento de la sombra en x y y
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        place.likes,
                        textAlign: TextAlign.left,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 8),
                      Text(
                        place.location,
                        textAlign: TextAlign.left,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Transform.translate(
                        offset: Offset((-10 * index).toDouble(), 0),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage:
                              AssetImage("assets/avatars/${index + 1}.jpg"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Place {
  final String name, location, likes;
  final Image placeImage;

  Place({
    required this.name,
    required this.location,
    required this.likes,
    required this.placeImage,
  });
}

List<Place> places = [
  Place(
    name: "Playa La Mina",
    location: "Paracas, Ica",
    likes: "2036",
    placeImage: Image.asset('assets/images/1.jpg'),
  ),
  Place(
    name: "Macchu Picchu",
    location: "Cusco, Cusco",
    likes: "5306",
    placeImage: Image.asset('assets/images/2.jpg'),
  ),
  Place(
    name: "Laguna 69",
    location: "Huaraz, Ancash",
    likes: "2036",
    placeImage: Image.asset('assets/images/3.jpg'),
  ),
  Place(
    name: "Laguna Parón",
    location: "Huaraz, Ancash",
    likes: "2036",
    placeImage: Image.asset('assets/images/4.jpg'),
  ),
];
