import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ImageDataProvider extends ChangeNotifier {
  // Declare the variables

  List<String> _images = [];
  bool _isLoading = false;
  List<String> _searchHistory = []; // Store the search history

  // Getters to access the variables
  List<String> get images => _images;
  bool get isLoading => _isLoading;
  List<String> get searchHistory => _searchHistory; // Return the search history

  // Function to search for images
  Future<void> searchImages(String query) async {
    _isLoading = true;
    notifyListeners(); // Notify listeners to update UI

    // Add the query to the search history if it isn't already there
    if (!_searchHistory.contains(query)) {
      _searchHistory.add(query);
    }

    final response = await http.get(
      Uri.parse(
          'https://api.unsplash.com/search/photos?query=$query&client_id=OHr9hQ6i2xJOKZdtWnUefimYoqwYBdly7a05hoOveJ0'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _images = List<String>.from(
        data['results'].map((image) => image['urls']['regular']),
      );
      _isLoading = false;
    } else {
      throw Exception('Failed to load images');
    }
    notifyListeners(); // Notify listeners again to update UI after fetching data
  }
}
