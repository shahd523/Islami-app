import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neww/ui/home/screen/OnBourding_Screen/OnBoarding_Screen.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/ui/home/screen/home.dart';

class SplashScreen extends StatefulWidget{
  static const String routeName="splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>OnBourding_Screen()));;
    });
  }
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Image.asset(AssetManager.splash
          ,width: double.infinity,fit: BoxFit.fill,),

      ),
    );
  }
}