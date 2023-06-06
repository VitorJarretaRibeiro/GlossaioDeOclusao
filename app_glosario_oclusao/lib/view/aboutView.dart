import 'package:flutter/material.dart';

import '../widgets/custom_item_drawer_widgets.dart';
import '../widgets/custom_visual_drawer_widgets.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 40,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: const [
                      Color.fromRGBO(25, 191, 195, 1),
                      Color.fromRGBO(177, 143, 240, 1),
                    ])),
              ),
            ),
            drawer: CustomVisualDrawerWidget(widgets: [
              CustomItemDrawerWidgets(
                  onPressed: () {
                    Navigator.of(context).pushNamed('t3');
                  },
                  title: "Principal",
                  tipIcon: Icons.home_outlined),
              CustomItemDrawerWidgets(
                  onPressed: () {
                    Navigator.of(context).pushNamed('t3');
                  },
                  title: "Questionários",
                  tipIcon: Icons.quiz_outlined),
              CustomItemDrawerWidgets(
                  onPressed: () {
                    Navigator.of(context).pushNamed('t3');
                  },
                  title: "Guia Rapido",
                  tipIcon: Icons.book_outlined),
              CustomItemDrawerWidgets(
                  onPressed: () {
                    Navigator.of(context).pushNamed('t3');
                  },
                  title: "Favoritos",
                  tipIcon: Icons.star_border_outlined),
              CustomItemDrawerWidgets(
                  onPressed: () {
                    Navigator.of(context).pushNamed('t3');
                  },
                  title: "Configurações",
                  tipIcon: Icons.settings_outlined),
              CustomItemDrawerWidgets(
                  onPressed: () {
                    Navigator.of(context).pushNamed('t3');
                  },
                  title: "Sobre",
                  tipIcon: Icons.error_outline_outlined),
            ]),
            body: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    "Sobre",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(25, 191, 195, 1),
                        fontSize: 32,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromRGBO(177, 143, 240, 1),
                                width: 5,
                              )),
                          child: ClipOval(
                            child: Image.asset('lib/images/Jarreta.jpg'),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Desenvolvedor",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(25, 191, 195, 1),
                                fontSize: 21,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Nome: Vitor Jarreta Ribeiro",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Código: 834117",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "E-mail: vitorjarreta@gmail.com",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "É estudante de Engenharia da Computação desde de 2020 e planeja seguir na área de desenvolviemento ou Dados.\nAtualmente trabalha na Blue 3 Investimentos com Estagiário de Dados, Analista de Suporte N1 e Desenvolvedor Apex Oracle.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Aplicativo",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(25, 191, 195, 1),
                        fontSize: 21,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "O Aplicativo foi desenvolvido para a disciplina de Novas Tecnologias de Informação e Comunicação, com o intuito de aprender sobre a linguagem Dart e o Framework Flutter. \nSimplesmente consiste em uma aplicação que serve como um termo de glossário para pessoal de odonto, assim conseguindo ter acesso rápido a termos importantes.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )));
  }
}
