import 'package:flutter/material.dart';

class SearchHistoryList extends StatelessWidget {
  final List<String> history;
  final Function(String) onSelect;

  SearchHistoryList({required this.history, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return history.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('No search history'),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: history.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(history[index]),
                onTap: () => onSelect(history[index]),
              );
            },
          );
  }
}
