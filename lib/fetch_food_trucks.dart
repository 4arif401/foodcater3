import 'dart:convert';
import 'package:http/http.dart' as http;
import 'food_truck.dart';

Future<List<FoodTruck>> fetchFoodTrucks() async {
  final response = await http.get(Uri.parse('http://10.0.2.2/foodcater/lib/connection/view_truck.php'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => FoodTruck.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load food trucks');
  }
}