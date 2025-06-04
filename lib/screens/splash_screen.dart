import 'dart:async';
import 'package:flutter/material.dart';
import 'main_screen.dart'; // main_screen.dart dosyasını import ediyoruz

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 saniye sonra MainScreen'e yönlendirme
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(), // MainScreen widget'ına yönlendiriliyor
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/logo.png', // Resim dosyasının yolunu belirtin
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
