import 'package:flutter/material.dart';


void erro(context, String mensage){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        mensage,
        style: TextStyle(
          color: Colors.black87,
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w600
        ),
        //: TextAlign.center,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.yellow[200],
    ));
}



void sucesso(context, String mensage){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        mensage,
        style: TextStyle(
          color: Colors.grey[200],
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w600
        ),
        //: TextAlign.center,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Color.fromRGBO(25, 191, 195,1),
    ));
}