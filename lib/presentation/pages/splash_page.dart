import 'dart:async';
import 'package:easy_expense/presentation/pages/welcome_page.dart';
import 'package:easy_expense/presentation/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  Future<void> checkUserLoggedIn() async {
    final user = _auth.currentUser;
    if (user != null) {
      Timer(Duration(seconds: 4), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeBottomBar();
        }));
      });
    } else {
      Timer(Duration(seconds: 4), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WelcomePage();
      }));
       });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7B61FF),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Vector.png"),
                Text(
                  "EasyExpenses",
                  style: TextStyle(
                    color: Color(0xffFFFFFFF),
                    fontSize: 36,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Transform.rotate(
                angle: -3.2, child: Image.asset("assets/recordcircle.png")),
          ),
          Positioned(bottom: 0, child: Image.asset("assets/recordcircle.png")),
        ],
      ),
    );
  }
}
