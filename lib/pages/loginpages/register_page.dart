// ignore_for_file: unused_import, library_private_types_in_public_api, file_names, non_constant_identifier_names

import 'package:attendence_management_system/pages/loginpages/forgetpass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/button.dart';
import '../bottomNavBar.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback LoginPage;
  const RegisterPage({Key? key, required this.LoginPage}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/newlogo.jpg'),
                const SizedBox(height: 125),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(13),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 450,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade50,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          color: Colors.grey.shade400)
                    ],
                  ),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      const Text(
                        'Sign Up',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Color.fromARGB(255, 6, 0, 79),
                        ),
                      ),
                      const SizedBox(height: 40),

                      TextField(
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Email ID',
                          hintText: 'Enter your Email ID',
                        ),
                      ),
                      const SizedBox(height: 10),
                      //Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: _passwordcontroller,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: 'Password',
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off_sharp
                                  : Icons.visibility_sharp,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _isObscure = !_isObscure;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Center(
                        child: Button(
                          onTap: signUp,
                          text: "Sign Up",
                        ),
                      ),
                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.LoginPage,
                            child: const Text(
                              'Login now',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
