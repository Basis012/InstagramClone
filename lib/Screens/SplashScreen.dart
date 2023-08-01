import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instanew/Screens/DashBoard.dart';
import 'package:instanew/Screens/Login.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 6),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard())));
    }
    else{
      Timer(Duration(seconds: 6),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login())));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Lottie.asset("assets/splash.json",animate: true,
        height: 150
        ),
      ),
    );
  }
}

