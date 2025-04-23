import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// FutureProvider to fetch FAQs from Firestore
final faqProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final snapshot = await FirebaseFirestore.instance.collection('faqs').get();
  return snapshot.docs.map((doc) {
    return {
      'question': doc['question'] ?? 'No Question',
      'answer': doc['answer'] ?? 'No Answer',
    };
  }).toList();
});
