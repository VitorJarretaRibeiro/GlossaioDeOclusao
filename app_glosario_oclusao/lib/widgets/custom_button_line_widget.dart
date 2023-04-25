

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class CustomButtonLineWidgets extends StatelessWidget {

  final VoidCallback onPressed;
  final String title;
  final Alignment tip;

  const CustomButtonLineWidgets({super.key, required this.onPressed, required this.title, required this.tip});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 40,
              alignment: tip,
              //--------------------------------------
              child: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color.fromRGBO(25, 191, 195, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ))
              //---------------------------
          );
  }
}