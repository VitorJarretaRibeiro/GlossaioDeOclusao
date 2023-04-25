import 'package:app_glosario_oclusao/controller/user_controller.dart';
// import 'package:app_glosario_oclusao/widgets/custom_blink_mensage_widgets.dart';
import 'package:app_glosario_oclusao/widgets/custom_button_line_widget.dart';
import 'package:app_glosario_oclusao/widgets/custom_field_widgets.dart';
import 'package:app_glosario_oclusao/widgets/custtom_button_gradient_widget.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

//-------------------------------------------------------------------------------------------------------------------
// Criando variáveis de controle
// ------------------------------------------------------------------------------------------------------------------
class _loginScreenState extends State<loginScreen> {
  final _emailFocusNode = FocusNode();
  final _senhaFocusNode = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authenticatorController = UserController();

// ------------------------------------------------------------------------------------------------------------------
//Intanciando o estado do focu
// ------------------------------------------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    //adicionando ouvintes de foco
    _emailFocusNode.addListener(_onEmailFocusChanged);
    _senhaFocusNode.addListener(_onSenhaFocusChanged);
  }

// ------------------------------------------------------------------------------------------------------------------
//Esvazaindo o foco e controller
// ------------------------------------------------------------------------------------------------------------------
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _senhaFocusNode.dispose();
    super.dispose();
  }

// ------------------------------------------------------------------------------------------------------------------
// Função para mudar a cor caso o campo e-mail tenha o foco sobre
// ------------------------------------------------------------------------------------------------------------------
  void _onEmailFocusChanged() {
    setState(() {
      _emailColor = _emailFocusNode.hasFocus
          ? Color.fromRGBO(25, 191, 195, 1)
          : Colors.black38;
    });
  }

// ------------------------------------------------------------------------------------------------------------------
// Função pra mudar a cor caso o campo senha tenha o foco sobre
// ------------------------------------------------------------------------------------------------------------------
  void _onSenhaFocusChanged() {
    setState(() {
      _senhaColor = _senhaFocusNode.hasFocus
          ? Color.fromRGBO(25, 191, 195, 1)
          : Colors.black38;
    });
  }

// ------------------------------------------------------------------------------------------------------------------
//definindo cores padrão
// ------------------------------------------------------------------------------------------------------------------
  Color _emailColor = Colors.black38;
  Color _senhaColor = Colors.black38;

// ------------------------------------------------------------------------------------------------------------------
// Criando Layout da página de Login
// ------------------------------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------------------------------------------------------------------------------------------------
      // Container para definir o espaço que será contruido o corpo do layout
      // Definido as dimensões das margens internas
      // ------------------------------------------------------------------------------------------------------------------
      body: Container(
        padding: EdgeInsets.only(left: 40, top: 60, right: 40),
        color: Colors.white,
        // ------------------------------------------------------------------------------------------------------------------
        // listem view para criar barra de rolagem de necessário e para seguir um lista, ou seja, cada box um a baixo do
        // outro
        // ------------------------------------------------------------------------------------------------------------------
        child: ListView(children: <Widget>[
          // ------------------------------------------------------------------------------------------------------------------
          // Conatiner para trazer a imagem nos padrões de Icone
          // ------------------------------------------------------------------------------------------------------------------
          Container(
            width: 128,
            height: 128,
            alignment: Alignment.center,
            child: Image.asset("lib/images/tooth.png"),
          ),
          // ------------------------------------------------------------------------------------------------------------------
          // Size Box para espaçamento
          // ------------------------------------------------------------------------------------------------------------------
          SizedBox(height: 20),
          // ------------------------------------------------------------------------------------------------------------------
          // Campo de texto do e-amil
          // ------------------------------------------------------------------------------------------------------------------
          CustomFielWidgets(
            controller: _emailController, 
            keyboardType: TextInputType.emailAddress, 
            focusNode: _emailFocusNode, 
            inputColor: _emailColor, 
            labelText: 'E-mail',
          ),
          // ------------------------------------------------------------------------------------------------------------------
          // epaçamento para proximo campo
          // ------------------------------------------------------------------------------------------------------------------
          SizedBox(
            height: 20,
          ),
          // ------------------------------------------------------------------------------------------------------------------
          //Campo Senha
          // ------------------------------------------------------------------------------------------------------------------
          CustomFielWidgets(
            controller: _passwordController, 
            keyboardType: TextInputType.text, 
            focusNode: _senhaFocusNode, 
            inputColor: _senhaColor, 
            labelText: 'Senha',
            obscureText: true,
          ),
          // ------------------------------------------------------------------------------------------------------------------
          //Container para colocar o botam de recuperar senha
          // ------------------------------------------------------------------------------------------------------------------
          CustomButtonLineWidgets(
              onPressed: () {
                Navigator.of(context).pushNamed('t1');
              },
              title: 'Recuperar Senha',
              tip: Alignment.centerRight),
          // ------------------------------------------------------------------------------------------------------------------
          //Espaçamento
          // ------------------------------------------------------------------------------------------------------------------
          SizedBox(
            height: 40,
          ),
          // ------------------------------------------------------------------------------------------------------------------
          // Criando um container para fazer o botão persnalizado
          // Por meio desse container pode criar um gradiente de cor
          // dentro dele sera inserido um flat button, só de texto
          // ------------------------------------------------------------------------------------------------------------------
          CustomButtonGradientWidgets(
              onPressed: () {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();

                bool auth = _authenticatorController.autheticatorLogin(email, password);

                if(email.isNotEmpty && password.isNotEmpty){
                  if(auth){
                    Navigator.of(context).pushNamed('carregar');
                  }else{
                    mensagem('E-mail ou senha não encontrados', Colors.yellow[200], Colors.black87);
                  }
                }else{
                  mensagem('E-mail ou senha não informado', Colors.yellow[200], Colors.black87);
                }
              },
              title: 'Login',
              imageIcon: Icon(Icons.person, color: Colors.white,),
              heightImageIcon: 48,
              widthImageIcon: 48,
            ),
          // ------------------------------------------------------------------------------------------------------------------
          //Espaçamento
          // ------------------------------------------------------------------------------------------------------------------
          SizedBox(
            height: 20,
          ),
          // ------------------------------------------------------------------------------------------------------------------
          //Container para colocar um divider e um texto escrito "OU"
          // ------------------------------------------------------------------------------------------------------------------
          SizedBox(
            height: 20,
            child: SizedBox(
              //---------------------------------
              child: Text(
                "Ou",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          ),
          // ------------------------------------------------------------------------------------------------------------------
          //Divider
          // ------------------------------------------------------------------------------------------------------------------
          SizedBox(
            height: 10,
            child: Divider(
              color: Colors.black38,
            ),
          ),
          // --------------------------------------------------------------------
          
          // ------------------------------------------------------------------------------------------------------------------
          CustomButtonLineWidgets(
              onPressed: () {
                var obj = _authenticatorController.list;
                Navigator.of(context).pushNamed('t2', arguments: obj);
              },
              title: 'Cadastre-se',
              tip: Alignment.center),
        ]),
      ),
    );
  }








  mensagem(String Title, backGroundColor, Color TitleColor) {
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
