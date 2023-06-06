import 'package:app_glosario_oclusao/view/aboutView.dart';
import 'package:app_glosario_oclusao/view/homeView.dart';
import 'package:app_glosario_oclusao/view/loadingView.dart';
import 'package:app_glosario_oclusao/view/loginView.dart';
import 'package:app_glosario_oclusao/view/recoverPasswordView.dart';
import 'package:app_glosario_oclusao/view/singUpView.dart';
import 'package:app_glosario_oclusao/view/technicalTermView.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:device_preview/device_preview.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
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