import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_netflix/pages/home_page.dart';
import 'package:lottie/lottie.dart';


class MyLoadingPage extends StatefulWidget {
  const MyLoadingPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoadingPage> createState() => _MyLoadingPageState();
} 

class _MyLoadingPageState extends State<MyLoadingPage> {
  @override
  void initState() {
    super.initState();
    loadAnimation();
  }

  Future<Timer>loadAnimation() async {
    return Timer(const Duration(seconds: 3), onLoadingComplete);
  }
  
  void onLoadingComplete() { 
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page Netflix')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/lotties/netflix.json',
          repeat: false,
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
      
    );
  }
}