import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostService {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Stream<QuerySnapshot<Map<String,dynamic>>> feed() => _db.collection('posts').orderBy('createdAt', descending: true).snapshots();

  Future<String> uploadImage(File file, String uid) async {
    final ref = _storage.ref().child('posts/$uid/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await ref.putFile(file);
    return ref.getDownloadURL();
  }

  Future<void> createPost({required String uid, required String username, required String imageUrl, required String caption}) =>
    _db.collection('posts').add({'userId': uid, 'username': username, 'imageUrl': imageUrl, 'caption': caption, 'createdAt': FieldValue.serverTimestamp(), 'likes': 0});
}
