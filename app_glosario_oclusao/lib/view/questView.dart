import 'package:app_glosario_oclusao/controller/exercicios_controller.dart';
import 'package:app_glosario_oclusao/widgets/custom_field_widgets.dart';
import 'package:app_glosario_oclusao/widgets/custom_item_drawer_widgets.dart';
import 'package:app_glosario_oclusao/widgets/custom_visual_drawer_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var txtEnunciado = TextEditingController();
  var txtAlternativaA = TextEditingController();
  var txtAlternativaB = TextEditingController();
  var txtAlternativaC = TextEditingController();
  var txtAlternativaD = TextEditingController();
  var txtAlternativaCorreta = TextEditingController();
  bool ativo = false;

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
                Navigator.of(context).pushNamed('t5');
              },
              title: "Sobre",
              tipIcon: Icons.error_outline_outlined),
        ]),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder<QuerySnapshot>(
            stream: ExercicioController().listar().snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Text(
                      'Não foi possível conectar',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300),
                    ),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(255, 255, 255, 0.85),
                    ),
                  );
                default:
                  final dados = snapshot.requireData;
                  if (dados.size > 0) {
                    return ListView.builder(
                        itemCount: dados.size,
                        padding: EdgeInsets.fromLTRB(40, 7, 40, 10),
                        itemBuilder: (context, index) {
                          String id = dados.docs[index].id;
                          dynamic item = dados.docs[index].data();
                          Card(
                            color: Colors.grey[200],
                            elevation: 5,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading:
                                  Icon(Icons.bookmark, color: Colors.black87),
                              title: Text(
                                item['enunciado']
                                    .toString()
                                    .replaceRange(30, null, "..."),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    fontFamily: 'Roboto'),
                              ),
                              /* subtitle: Text(
                              _foundlist[index]['description'].toString().replaceRange(30, null, "...")
                            ), */
                              onTap: () {
                                txtEnunciado = item['enunciado'];
                                txtAlternativaA = item['alternativa_a'];
                                txtAlternativaB = item['alternativa_b'];
                                txtAlternativaC = item['alternativa_c'];
                                txtAlternativaD = item['alternativa_d'];
                                txtAlternativaCorreta =
                                    item['alternativa_correta'];
                                ativo = item['ativo'];
                                salvarExercicio(context, docId: id);
                              },
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text(
                        'Nenhum exercício encontrado',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300),
                      ),
                    );
                  }
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /* salvarExericio(context); */
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void salvarExercicio(context, {docId}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Nenhum exercício encontrado',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300),
            ),
            content: SizedBox(
              height: 250,
              width: 300,
              child: Column(
                children: [
                  CustomFielWidgets(
                    focusNode: FocusNode(),
                    inputColor: Colors.black38,
                    keyboardType: TextInputType.text,
                    labelText: "Enunciado",
                    controller: txtEnunciado,
                  ),
                  CustomFielWidgets(
                    focusNode: FocusNode(),
                    inputColor: Colors.black38,
                    keyboardType: TextInputType.text,
                    labelText: "Alternativa A",
                    controller: txtAlternativaA,
                  ),
                  CustomFielWidgets(
                    focusNode: FocusNode(),
                    inputColor: Colors.black38,
                    keyboardType: TextInputType.text,
                    labelText: "Alternativa B",
                    controller: txtAlternativaB,
                  ),
                  CustomFielWidgets(
                    focusNode: FocusNode(),
                    inputColor: Colors.black38,
                    keyboardType: TextInputType.text,
                    labelText: "Alternativa C",
                    controller: txtAlternativaC,
                  ),
                  CustomFielWidgets(
                    focusNode: FocusNode(),
                    inputColor: Colors.black38,
                    keyboardType: TextInputType.text,
                    labelText: "Alternativa D",
                    controller: txtAlternativaD,
                  ),
                  CustomFielWidgets(
                    focusNode: FocusNode(),
                    inputColor: Colors.black38,
                    keyboardType: TextInputType.text,
                    labelText: "Alternativa Correta",
                    controller: txtAlternativaCorreta,
                  ),
                  ListTile(
                    title: Text(
                      'Ativo',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
