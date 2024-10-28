import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wtfeua/src/features/auth/presentation/sign_in.dart';
import 'package:wtfeua/src/features/home/presentation/home_page.dart';

class Authentication extends StatelessWidget {
  //const Authentication({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return HomePage();
    } else {
      return SignIn();
    }
  }
}
