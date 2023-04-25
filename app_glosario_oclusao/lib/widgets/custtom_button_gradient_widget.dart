import 'package:flutter/material.dart';

class CustomButtonGradientWidgets extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? imageIcon;
  final double heightImageIcon;
  final double widthImageIcon;

  const CustomButtonGradientWidgets(
      {super.key, required this.onPressed, required this.title, this.imageIcon, this.heightImageIcon = 10, this.widthImageIcon= 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsetsDirectional.fromSTEB(30, 5, 30, 5),
      alignment: Alignment.centerLeft,
      //------------------------------------------------------
      //Criando gradiente
      //-----------------------------------------------------
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
                0.3,
                1
              ],
              colors: const [
                Color.fromRGBO(25, 191, 195, 1),
                Color.fromRGBO(177, 143, 240, 1)
              ]),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          )),
      //------------------------------------------------------
      child: SizedBox(
          // texte button
          child: TextButton(
              onPressed: onPressed,
              // ------------------------------------------------------------------------------------------------------------------
              //Definfino linha para colocar tanto o texto quanto a imagem definifa
              // ------------------------------------------------------------------------------------------------------------------
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //dando spaçamento entre as colunas
                children: [
                  //Texto
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  //imagem
                  SizedBox(
                    height: heightImageIcon,
                    width: widthImageIcon,
                    child: imageIcon,
                  ),
                ],
              ))),
    );
  }
}
