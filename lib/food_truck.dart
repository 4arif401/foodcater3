class FoodTruck {
  final String name;
  final String menu;
  final String schedule;
  final double latitude;
  final double longitude;

  FoodTruck({
    required this.name,
    required this.menu,
    required this.schedule,
    required this.latitude,
    required this.longitude,
  });

  factory FoodTruck.fromJson(Map<String, dynamic> json) {
    return FoodTruck(
      name: json['name'],
      menu: json['menu'],
      schedule: json['schedule'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
    );
  }
}