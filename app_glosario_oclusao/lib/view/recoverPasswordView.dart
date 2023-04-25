import 'package:app_glosario_oclusao/controller/user_controller.dart';
import 'package:app_glosario_oclusao/widgets/custom_button_line_widget.dart';
import 'package:app_glosario_oclusao/widgets/custom_field_widgets.dart';
import 'package:app_glosario_oclusao/widgets/custtom_button_gradient_widget.dart';
import 'package:flutter/material.dart';


class RecoverScreen extends StatefulWidget {
  const RecoverScreen({super.key});

  @override
  State<RecoverScreen> createState() => _RecoverScreenState();
}


class _RecoverScreenState extends State<RecoverScreen> {
  final _controllerFocusNode = FocusNode();
  final _authenticatorRecover= UserController();
  final _emailController = TextEditingController();

// ------------------------------------------------------------------------------------------------------------------
//Intanciando o estado do focu
// ------------------------------------------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    //adicionando ouvintes de foco
    _controllerFocusNode.addListener(_oncontrollerFocusChanged);
  }

// ------------------------------------------------------------------------------------------------------------------
//Esvazaindo o foco e controller
// ------------------------------------------------------------------------------------------------------------------
  @override
  void dispose() {
    _controllerFocusNode.dispose();
    super.dispose();
  }

// ------------------------------------------------------------------------------------------------------------------
// Função para mudar a cor caso o campo e-mail tenha o foco sobre
// ------------------------------------------------------------------------------------------------------------------
  void _oncontrollerFocusChanged() {
    setState(() {
      _controllerColor = _controllerFocusNode.hasFocus
          ? Color.fromRGBO(25, 191, 195, 1)
          : Colors.black38;
    });
  }

// ------------------------------------------------------------------------------------------------------------------
//definindo cores padrão
// ------------------------------------------------------------------------------------------------------------------
  Color _controllerColor = Colors.black38;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.3, 1],
              colors: const [
                Color.fromRGBO(25, 191, 195,1),
                Color.fromRGBO(177, 143, 240, 1),
              ]
            ),
          ),
        ),
        leading: IconButton(
          onPressed:(){
            Navigator.of(context).pushNamed('t0');
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          right: 40
          , left: 40
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget> [
            Container(
              width: 128,
              height: 128,
              alignment: Alignment.center,
              child: Image.asset("lib/images/locker.png"),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Problemas para logar ?",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Insira seu e-mail para que possa voltar a acessar a sua conta",
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,),
           CustomFielWidgets(
            controller: _emailController,
            keyboardType: TextInputType.text, 
            focusNode: _controllerFocusNode, 
            inputColor: _controllerColor, 
            labelText: 'E-mail'
          ),
            SizedBox(height: 20,),
           CustomButtonGradientWidgets(
            onPressed: () {
              String email = _emailController.text.trim();

              bool auth = _authenticatorRecover.autheticatorRecover(email);

              if(email.isNotEmpty){
                if(auth){
                  mensagem('E-mail de recuperação enviado', Color.fromRGBO(25, 191, 195,1), Colors.grey[200]);
                }else{
                  mensagem('E-mail não encontrado', Colors.yellow[300], Colors.black87);
                }
              }else{
                mensagem('E-mail não foi informado', Colors.yellow[300], Colors.black87);
              }
            }, 
            title: 'Enviar', 
            imageIcon: Icon(Icons.email_rounded, color: Colors.white,),
            heightImageIcon: 32,
            widthImageIcon: 32,
          ),
            SizedBox(height: 20,),
            SizedBox(
              height: 20,
              child: SizedBox(
                child: Text(
                  "Ou"
                  ,textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.black38,

              ),
            ),
            CustomButtonLineWidgets(
              onPressed: () {
                Navigator.of(context).pushNamed('t2');
              }, 
              title: "Cadastre-se", 
              tip: Alignment.center
            ),
          ],
        ),
      ),
    );
  }


  mensagem(String Title, backGroundColor,  TitleColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        Title,
        style: TextStyle(
          color: TitleColor,
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w600
        ),
        //: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: backGroundColor,
    ));
  }

}