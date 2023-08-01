import 'package:flutter/material.dart';

import '../loginPage.dart';
import '../register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially show login
  bool showlogin = true;
  void toggleScr() {
    setState(
      () {
        showlogin = !showlogin;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return LoginPage(RegisterPage: toggleScr);
    } else {
      return RegisterPage(LoginPage: toggleScr);
    }
  }
}
