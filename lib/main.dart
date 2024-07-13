import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'food_truck.dart';
import 'fetch_food_trucks.dart';
import 'about_us.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Truck Finder',
      home: FoodTruckMap(),
    );
  }
}

class FoodTruckMap extends StatefulWidget {
  @override
  _FoodTruckMapState createState() => _FoodTruckMapState();
}

class _FoodTruckMapState extends State<FoodTruckMap> {
  late GoogleMapController mapController;
  late Future<List<FoodTruck>> futureFoodTrucks;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    futureFoodTrucks = fetchFoodTrucks();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showCustomInfoWindow(BuildContext context, FoodTruck foodTruck) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                foodTruck.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Menu: ${foodTruck.menu}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Schedule: ${foodTruck.schedule}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Scaffold(
        appBar: AppBar(
          title: Text('FoodCater'),
        ),
        body: FutureBuilder<List<FoodTruck>>(
          future: futureFoodTrucks,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<FoodTruck> foodTrucks = snapshot.data!;
              return GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(foodTrucks[0].latitude, foodTrucks[0].longitude),
                  zoom: 12,
                ),
                markers: foodTrucks.map((foodTruck) {
                  return Marker(
                    markerId: MarkerId(foodTruck.name),
                    position: LatLng(foodTruck.latitude, foodTruck.longitude),
                    /*infoWindow: InfoWindow(
                      title: foodTruck.name,
                      snippet: '${foodTruck.menu}',
                      onTap: () => _showCustomInfoWindow(context, foodTruck),
                    ),*/
                    onTap: () => _showCustomInfoWindow(context, foodTruck),
                  );
                }).toSet(),
              );
            }
          },
        ),
      ),
      AboutUsPage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 0, 13),
        onTap: _onItemTapped,
      ),
    );
  }
}
