import 'package:flutter/material.dart';

class SearchHistoryList extends StatelessWidget {
  final List<String> history;
  final Function(String) onSelect;

  const SearchHistoryList(
      {Key? key, required this.history, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
