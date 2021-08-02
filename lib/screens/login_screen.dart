import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jahitid/screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFE7F99), Color(0xFFFBB2C1)])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_white.png',
                  scale: 0.7,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                FormLogin(label: 'Email/Username', obsecure: false),
                SizedBox(height: 10),
                FormLogin(label: 'Password', obsecure: true),
                SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Color(0xFFFE7F99),
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  final String label;
  final bool obsecure;

  FormLogin({required this.label, required this.obsecure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: obsecure,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
