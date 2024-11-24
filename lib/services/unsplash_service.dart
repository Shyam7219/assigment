import 'package:http/http.dart' as http;
import 'dart:convert';

class UnsplashService {
  final String accessKey =
      'OHr9hQ6i2xJOKZdtWnUefimYoqwYBdly7a05hoOveJ0'; // Your access key here

  Future<List<String>> fetchImages(String query) async {
    final url = Uri.parse(
        'https://api.unsplash.com/search/photos?query=$query&client_id=$accessKey');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> imageUrls = [];
        for (var result in data['results']) {
          String imageUrl =
              result['urls']['regular']; // This gives you the full image URL
          imageUrls.add(imageUrl);
        }
        return imageUrls;
      } else {
        throw Exception('Failed to load images');
      }
    } catch (error) {
      throw Exception('Failed to load images: $error');
    }
  }
}
