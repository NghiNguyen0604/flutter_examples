import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../models/account.dart';

class FirebaseAuthentication {
  final firebaseAuthInstance = FirebaseAuth.instance;

  Future<void> logIn(Account acc, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: acc.email, password: acc.wwid);
    } catch (e) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
            content: Text('Email hoặc mật khẩu không chính xác')));
    }
  }
}

final authProvider = Provider((ref) => FirebaseAuthentication());
