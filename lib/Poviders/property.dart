import 'dart:convert';

import 'package:fakestoreapp/Models/Propertystate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class PropertyNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  PropertyNotifier() : super(AsyncValue.loading());
  

  Future<List<Product>> getProperties() async {
    const url = "https://fakestoreapi.com/products";
    try{
    final response = await http.get(
      Uri.parse(url),
      
    );
     print("HTTP Response: ${response.statusCode} - ${response.body}");
     var userDetails = json.decode(response.body);
      print("Response: ${userDetails}");
       if (response!=Null) {
        print("Response 200");
        List<dynamic> userDetails = json.decode(response.body);
        if (userDetails.isNotEmpty) {
          //final property = userDetails.first;
          final properties = userDetails.map((json) => Product.fromJson(json)).toList();
          state = AsyncValue.data(properties);
           
           return userDetails.map((json) => Product.fromJson(json)).toList();
        }
        else {
          print("Response 200 but empty body");
          throw Exception('No properties found');
        }
      } else {
        print("Failed response: ${response.statusCode} - ${response.body}");
        throw Exception('Failed to load properties');
      }
    } catch (e) {
      print("Exception caught: $e");
      throw Exception('Failed to load properties');
    }
  }
  // Sorting method for ascending price
  void sortByPriceAscending() {
    state.whenData((properties) {
      final sortedProperties = List<Product>.from(properties);
      sortedProperties.sort((a, b) => a.price.compareTo(b.price));
      state = AsyncValue.data(sortedProperties);
    });
  }

  // Sorting method for descending price
  void sortByPriceDescending() {
    state.whenData((properties) {
      final sortedProperties = List<Product>.from(properties);
      sortedProperties.sort((a, b) => b.price.compareTo(a.price));
      state = AsyncValue.data(sortedProperties);
    });
  }
  
}

final propertyprovider =
    StateNotifierProvider<PropertyNotifier, AsyncValue<List<Product>>>((ref) {
  return PropertyNotifier();
});
