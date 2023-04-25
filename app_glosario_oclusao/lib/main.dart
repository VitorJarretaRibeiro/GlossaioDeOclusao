import 'package:app_glosario_oclusao/view/aboutView.dart';
import 'package:app_glosario_oclusao/view/homeView.dart';
import 'package:app_glosario_oclusao/view/loadingView.dart';
import 'package:app_glosario_oclusao/view/loginView.dart';
import 'package:app_glosario_oclusao/view/recoverPasswordView.dart';
import 'package:app_glosario_oclusao/view/singUpView.dart';
import 'package:app_glosario_oclusao/view/technicalTermView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Glossário de Oclusão",
      initialRoute: 't0',
      routes: {
        't0': (context) => loginScreen(),
        't1': (context) => RecoverScreen(),
        't2': (context) => singUpScreen(),
        't3': (context) => HomeScreen(),
        't4':(context) => TechnicalTermScreen(),
        't5':(context) => AboutScreen(),
        'carregar': (context) => loadingScreen()
      },
    );
  }
}
