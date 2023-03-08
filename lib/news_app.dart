import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:news_app/views/news_home.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My News Friend',
      theme: ThemeData(primarySwatch: Colors.red),
      home: AnimatedSplashScreen(
            duration: 500,
            splashIconSize: 300,
            splash: 'assets/news.png',
            nextScreen: const HomeScreen(),
            splashTransition: SplashTransition.fadeTransition,            
            backgroundColor: Colors.red),
    );
  }
}
