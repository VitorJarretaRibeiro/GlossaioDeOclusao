

import 'package:flutter/material.dart';


class CustomVisualDrawerWidget extends StatelessWidget {

  final List<Widget> widgets;

  const CustomVisualDrawerWidget({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Drawer(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [
                    Color.fromRGBO(25, 191, 195, 1),
                    Color.fromRGBO(177, 143, 240, 1),
                  ])),
              child: Column(children: widgets,)
            )
    );
  }
}