import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/image_provider.dart';
import '../widgets/carousel.dart';
import '../widgets/search_bar.dart' as custom; // Alias to resolve the conflict
import '../widgets/search_history_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageDataProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Unsplash Gallery')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            custom.SearchBar(
              onSearch: (query) => imageProvider.searchImages(query),
            ),
            if (imageProvider.isLoading)
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(child: CircularProgressIndicator()),
              )
            else
              Container(
                height: 300, // Fixed height for the carousel
                child: Carousel(images: imageProvider.images),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchHistoryList(
                history: imageProvider.searchHistory,
                onSelect: imageProvider.searchImages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
