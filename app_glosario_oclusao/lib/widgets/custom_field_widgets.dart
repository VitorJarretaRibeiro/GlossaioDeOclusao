import 'package:flutter/material.dart';



class CustomFielWidgets extends StatelessWidget {

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final Color inputColor;
  final String labelText;
  final bool obscureText;

  const CustomFielWidgets({super.key, this.controller, required this.keyboardType, required this.focusNode, required this.inputColor, required this.labelText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            controller: controller,
            obscureText: obscureText,
            // keyboardType: keyboardType, //defininfo o controlle do campo como a variável criada
            focusNode:focusNode, //defininfo o focus node com a variavel criada
            cursorColor:
                Color.fromRGBO(25, 191, 195, 1), //mudando a cor do curso
            //--------------------------
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(
                  color: inputColor, //chamando cor padrão
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                enabledBorder: OutlineInputBorder(
                    //habilitando bordas
                    borderSide: BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    //mudando a borda quando se tem o foco
                    borderSide:
                        BorderSide(color: Color.fromRGBO(25, 191, 195, 1)),
                    borderRadius: BorderRadius.circular(10))),
            // ---------------------------------
            style: TextStyle(fontSize: 20),
          );
  }
}