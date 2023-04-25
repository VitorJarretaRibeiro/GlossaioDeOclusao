import 'package:flutter/material.dart';
import 'dart:async';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, 't3');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
              Color.fromRGBO(25, 191, 195, 1),
              Color.fromRGBO(177, 143, 240, 1)
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: Color.fromRGBO(255, 255, 255, 0.85),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Carregando',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
