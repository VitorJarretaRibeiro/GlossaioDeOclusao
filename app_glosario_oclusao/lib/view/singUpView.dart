import 'package:app_glosario_oclusao/controller/user_controller.dart';
import 'package:app_glosario_oclusao/model/user_model.dart';
import 'package:app_glosario_oclusao/widgets/custom_field_widgets.dart';
import 'package:app_glosario_oclusao/widgets/custtom_button_gradient_widget.dart';
import 'package:flutter/material.dart';

class singUpScreen extends StatefulWidget {
  const singUpScreen({super.key});

  @override
  State<singUpScreen> createState() => _singUpScreenState();
}

class _singUpScreenState extends State<singUpScreen> {
  final _nomeFocusNode = FocusNode();
  final _idStudentFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  final _nomeController = TextEditingController();
  final _idStudentController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  final _addUserController = UserController();
  
  List<User> obj = [];

  // ------------------------------------------------------------------------------------------------------------------
//Intanciando o estado do focu
// ------------------------------------------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    //adicionando ouvintes de foco
    _nomeFocusNode.addListener(_onNomeFocusChanged);
    _idStudentFocusNode.addListener(_onIdStudentFocusChanged);
    _emailFocusNode.addListener(_onEmailFocusChanged);
    _passwordFocusNode.addListener(_onPasswordFocusChanged);
    _confirmPasswordFocusNode.addListener(_onConfirmPasswordFocusChanged);
  }

// ------------------------------------------------------------------------------------------------------------------
//Esvazaindo o foco e controller
// ------------------------------------------------------------------------------------------------------------------
  @override
  void dispose() {
    _nomeFocusNode.dispose();
    _idStudentFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

// ------------------------------------------------------------------------------------------------------------------
// Função para mudar a cor caso o campo e-mail tenha o foco sobre
// ------------------------------------------------------------------------------------------------------------------
  void _onNomeFocusChanged() {
    setState(() {
      _nomeColor = _nomeFocusNode.hasFocus
          ? Color.fromRGBO(25, 191, 195, 1)
          : Colors.black38;
    });
  }

  void _onIdStudentFocusChanged() {
    setState(() {
      _idStudentColor = _idStudentFocusNode.hasFocus
          ? Color.fromRGBO(25, 191, 195, 1)
          : Colors.black38;
    });
  }

  void _onEmailFocusChanged() {
    setState(() {
      _emailColor = _emailFocusNode.hasFocus
          ? Color.fromRGBO(25, 191, 195, 1)
          : Colors.black38;
    });
  }

  void _onPasswordFocusChanged() {
    setState(() {
      _passwordColor = _passwordFocusNode.hasFocus
          ? Color.fromRGBO(25, 191, 195, 1)
          : Colors.black38;
    });
  }

  void _onConfirmPasswordFocusChanged() {
    setState(() {
      _confirmPasswordColor = _confirmPasswordFocusNode.hasFocus
          ? Color.fromRGBO(25, 191, 195, 1)
          : Colors.black38;
    });
  }

// ------------------------------------------------------------------------------------------------------------------
//definindo cores padrão
// ------------------------------------------------------------------------------------------------------------------
  Color _nomeColor = Colors.black38;
  Color _idStudentColor = Colors.black38;
  Color _emailColor = Colors.black38;
  Color _passwordColor = Colors.black38;
  Color _confirmPasswordColor = Colors.black38;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Color.fromRGBO(177, 143, 240, 1),
                  Color.fromRGBO(25, 191, 195, 1)
                ]),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('t0');
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, right: 40, left: 40),
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              width: 82,
              height: 82,
              alignment: Alignment.center,
              child: Image.asset('lib/images/profile.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Crie seu perfil para acessar a plataforma",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomFielWidgets(
                controller: _nomeController,
                keyboardType: TextInputType.name,
                focusNode: _nomeFocusNode,
                inputColor: _nomeColor,
                labelText: 'Nome'),
            SizedBox(
              height: 10,
            ),
             CustomFielWidgets(
                controller: _idStudentController,
                keyboardType: TextInputType.name,
                focusNode: _idStudentFocusNode,
                inputColor: _idStudentColor,
                labelText: 'Código de Matrícula'),
            SizedBox(
              height: 10,
            ), 
            CustomFielWidgets(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                inputColor: _emailColor,
                labelText: 'E-mail'),
            SizedBox(
              height: 10,
            ),
            CustomFielWidgets(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              focusNode: _passwordFocusNode,
              inputColor: _passwordColor,
              labelText: 'Senha',
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            CustomFielWidgets(
              controller: _confirmPasswordController,
              keyboardType: TextInputType.text,
              focusNode: _confirmPasswordFocusNode,
              inputColor: _confirmPasswordColor,
              labelText: 'Confirmar Senha',
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Divider(
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtonGradientWidgets(
              onPressed: () {
                String name = _nomeController.text.trim();
                String idStudent= _idStudentController.text.trim();
                /*int parseIdStudent = int.parse(idStudent); */
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                String confirmPassword = _confirmPasswordController.text.trim();

                UserController().criarConta(context, name, email, password, confirmPassword, idStudent );
              },
              title: "Cadastrar",
              imageIcon: Icon(
                Icons.person_add_alt_1_outlined,
                color: Colors.white,
              ),
              heightImageIcon: 32,
              widthImageIcon: 32,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  mensagem(String Title, backGroundColor, TitleColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        Title,
        style: TextStyle(
            color: TitleColor,
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.w600),
        //: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: backGroundColor,
    ));
  }
}
