import 'package:flutter/material.dart';
import 'package:reel_downloader/views/home-page.dart';
import 'package:reel_downloader/views/splash-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Reels Down",
      home: SplashScreen(),
    );
  }
}
