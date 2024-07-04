// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String itemsUrl = 'http://127.0.0.1:8000/api/items/';
  final String regionsUrl = 'http://127.0.0.1:8000/api/regions/';
  final String wilayaUrl = 'http://127.0.0.1:8000/api/wilayat/';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(itemsUrl));
    print('Items API Response: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Item> items = body.map((dynamic item) => Item.fromJson(item)).toList();
      items.forEach((item) {
        print('Item: ${item.name}, Price: ${item.price}, Rating: ${item.rating}');
      });

      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<Region>> fetchRegions() async {
    final response = await http.get(Uri.parse(regionsUrl));
    print('Regions API Response: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Region> regions = body.map((dynamic region) => Region.fromJson(region)).toList();
      regions.forEach((region) {
        print('Region: ${region.name}, Type: ${region.regionType}, Activities: ${region.nbrActivities}');
      });

      return regions;
    } else {
      throw Exception('Failed to load regions');
    }
  }

  Future<List<Wilayat>> fetchWilayat() async {
    final response = await http.get(Uri.parse(wilayaUrl));
    print('Wilayat API Response: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Wilayat> wilayat = body.map((dynamic wilaya) => Wilayat.fromJson(wilaya)).toList();
      wilayat.forEach((wilaya) {
        print('Wilaya: ${wilaya.name}, Description: ${wilaya.description}');
      });

      return wilayat;
    } else {
      throw Exception('Failed to load wilayat');
    }
  }
}
class Region {
  final int id;
  final String regionType;
  final String name;
  final int nbrActivities;
  final String description;

  Region({
    required this.id,
    required this.regionType,
    required this.name,
    required this.nbrActivities,
    required this.description,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      regionType: json['region_type'],
      name: json['name'],
      nbrActivities: json['nbr_activities'],
      description: json['description'],
    );
  }
}

class Wilayat {
  final int id;
  final String name;
  final String description;
  final String picture;

  Wilayat({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
  });

  factory Wilayat.fromJson(Map<String, dynamic> json) {
    return Wilayat(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picture: json['picture'],
    );
  }
}

class Item {
  final int id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String itemType;
  final String fullDescription;
  final String highlight;
  final String url;
  final String timeString;
  final String picture;
  final int region;
  final int? wilayat; // Make wilayat nullable

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.itemType,
    required this.fullDescription,
    required this.highlight,
    required this.url,
    required this.timeString,
    required this.picture,
    required this.region,
    this.wilayat, // Allow null values
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
      rating: double.parse(json['rating']),
      itemType: json['item_type'],
      fullDescription: json['full_description'],
      highlight: json['highlight'],
      url: json['url'],
      timeString: json['time_string'],
      picture: json['picture'],
      region: json['region'],
      wilayat: json['wilayat'], // Handle nullable value
    );
  }
}



