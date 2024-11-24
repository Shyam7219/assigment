import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addSearchHistory(String query) async {
    await _firestore.collection('search_history').add({
      'query': query,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<List<String>> getSearchHistory() async {
    final querySnapshot = await _firestore
        .collection('search_history')
        .orderBy('timestamp', descending: true)
        .get();
    return querySnapshot.docs.map((doc) => doc['query'] as String).toList();
  }
}
