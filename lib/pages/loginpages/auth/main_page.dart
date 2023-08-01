// ignore_for_file: prefer_ _ ructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../bottomNavBar.dart';
import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LoginNavScreen();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
