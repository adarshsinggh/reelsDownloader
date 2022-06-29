import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reel_downloader/constants/color-constants.dart';
import 'package:reel_downloader/views/home-page.dart';
import 'package:reel_downloader/views/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool? isLoggedIn = false;
  var maxHeight;
  var maxWidth;

  @override
  void initState(){
    super.initState();
    startTime();
  }

  startTime() async{
  Duration _duration = const Duration(milliseconds: 1500);
  return Timer(_duration, _navigateToHome);
  }

  void _navigateToHome() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool? isLoggedIn = preferences.getBool("isLoggedin");
  if(isLoggedIn==true){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),));
  }else{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),));
  }
}

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
    maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Container(
            height: maxHeight*.3,
            width: maxWidth*.5,
            child: Image.asset("assets/images/logo.webp")
        ),
      ),
    );
  }
}

