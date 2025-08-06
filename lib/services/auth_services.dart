import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  AppUser? _appUser;
  AppUser? get appUser => _appUser;

  Stream<AppUser?> get appUserStream {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      final doc = await _db.collection('users').doc(user.uid).get();
      if (!doc.exists) return null;
      _appUser = AppUser.fromMap(user.uid, doc.data()!);
      notifyListeners();
      return _appUser;
    });
  }

  Stream<AppUser?> get appUser => appUserStream;

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> register(String email, String password, Map<String, dynamic> userData) async {
    final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await _db.collection('users').doc(result.user!.uid).set(userData);
  }
}