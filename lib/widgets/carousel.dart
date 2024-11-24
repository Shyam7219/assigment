import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  List<String> images;

  Carousel({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Image.network(
          images[index] as String, // Use the URL from the provider
          fit: BoxFit.cover,
        );
      },
    );
  }
}
