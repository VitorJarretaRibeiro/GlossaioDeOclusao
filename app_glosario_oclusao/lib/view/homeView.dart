import 'package:app_glosario_oclusao/controller/user_controller.dart';
import 'package:app_glosario_oclusao/widgets/custom_item_drawer_widgets.dart';
import 'package:app_glosario_oclusao/widgets/custom_visual_drawer_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _list = [
    {
      "id": 1,
      "title": "Relação Cêntrica",
      "description":
          "Relacionamento maxilomandibular independente do contato dentário, no qual os côndilos se articulam na posição anterossuperior contra as inclinações posteriores das eminências articulares. Nesta posição, a mandíbula realiza apenas um movimento de rotação. A partir desta posição fisiológica, de relação maxilomandibular, o paciente pode realizar movimentos laterais, verticais ou protrusivos. Clinicamente é uma posição de referência útil e repetível. Portanto, a RC é uma posição condilar que independe dos contatos dentários."
    },
    {
      "id": 2,
      "title": "Espaço Funcional Livre",
      "description":
          "É a distância entre os dentes antagonistas quando a mandíbula está em posição de repouso postural. É a diferença entre a dimensão vertical de repouso e a de oclusão e apresenta valores médios de 3 mm. O Glossário de termos protéticos, em sua 9ª edição (GPT-9, 2017) conceitua esse espaço como Espaço de Repouso Interoclusal (IORS – interoclusal rest space)."
    },
    {
      "id": 3,
      "title": "Máxima Intercuspidação Habitual",
      "description":
          "Posição de intercuspidação completa dos dentes opostos, independentemente da posição condilar. Às vezes referida como o melhor ajuste dos dentes, independentemente da posição condilar."
    },
    {
      "id": 4,
      "title": "Curva de Spee",
      "description":
          "Curva anteroposterior que se estende da ponta do canino até as cúspides do último dente, em formato ascendente."
    },
    {
      "id": 5,
      "title": "Curva de Wilson",
      "description":
          "Curva mediolateral. Em teoria, a oclusão deve ser esférica, a curvatura das cúspides, tal como previsto no plano frontal expresso em ambos os arcos; a curvatura no arco mandibular sendo côncava e o no arco maxilar sendo convexa."
    },
    {
      "id": 6,
      "title": "Fenômeno de Christensen",
      "description":
          "O espaço que ocorre entre as superfícies oclusais dos dentes posteriores antagonistas durante a protrusão mandibular."
    },
    {
      "id": 7,
      "title": "Guia anterior",
      "description":
          "Relação dos dentes anteriores que evita o contato dos dentes posteriores em todos os movimentos mandibulares excêntricos."
    },
    {
      "id": 8,
      "title": "Guia Canina",
      "description":
          "Uma forma de proteção articular mútua, na qual o overlap horizontal e vertical dos caninos desocluem os dentes posteriores nos movimentos excursivos da mandíbula."
    },
    {
      "id": 9,
      "title": "Interferência Oclusal",
      "description":
          "Qualquer contato dentário que impeça as demais superfícies oclusais de realizarem contatos oclusais estáveis e harmônicos."
    },
    {
      "id": 10,
      "title": "Trauma Oclusal",
      "description":
          "Trauma nos tecidos periodontais a partir de forças funcionais ou parafuncionais, causando prejuízos que excedem as capacidades adaptativas e reparadoras, pode ser autolimitado ou progressivo."
    },
    {
      "id": 11,
      "title": "Dimensão Vertical de Oclusão",
      "description":
          "Distância entre dois pontos anatômicos ou selecionados/marcados (geralmente um na ponta do nariz e outro no queixo) na posição de máxima intercuspidação habitual (MIH)."
    },
    {
      "id": 12,
      "title": "Dimensão Vertical de Repouso",
      "description":
          "Quando o paciente está em posição de repouso confortável, com os côndilos em posição neutra, não forçada, e os músculos encontram-se em estado de mínima atividade de contração."
    },
    {
      "id": 13,
      "title": "Plano Oclusal",
      "description":
          "Plano estabelecido pelas superfícies incisais e oclusais dos dentes."
    },
    {
      "id": 14,
      "title": "Posição Oclusa",
      "description":
          "Relação entre a maxila e mandíbula quando a mandíbula está fechada e os destes estão na posição de máxima intercuspidação, esta posição pode ou não ser coincidente com a oclusão cêntrica."
    },
    {
      "id": 15,
      "title": "Oclusão cêntrica",
      "description":
          "Posição de contatos dentários na qual a mandíbula está em relação cêntrica, pode ou não coincidir com a máxima intercuspidação habitual."
    },
  ];
  
  List<Map<String,dynamic>> _foundlist = [];

// ------------------------------------------------------------------------------------------------------------------
//Intanciando o estado do focu
// ------------------------------------------------------------------------------------------------------------------
  @override
  void initState() {
    _foundlist = _list;
    super.initState();
    //adicionando ouvintes de foco
  }


  void _funFilter(String value){
    List<Map<String,dynamic>> results = [];
    if (value.isEmpty) {
      results = _list;
    } else {
      results = _list.where((x) => x["title"].toLowerCase().contains(value.toLowerCase())).toList();
    }

    setState(() {
      _foundlist = results;
    });
  }

  

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
          CustomItemDrawerWidgets(
              onPressed: () {
                UserController().logout();
                Navigator.of(context).pushNamed('t0');
              },
              title: "Sair",
              tipIcon: Icons.logout),
        ]),
        body: Column(children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: const [
                    Color.fromRGBO(25, 191, 195, 1),
                    Color.fromRGBO(177, 143, 240, 1),
                  ])),
              child: SizedBox(
                width: 240,
                height: 280,
                child: Image.asset('lib/images/logounaerpWhite.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 420,
              child: TextFormField(
                onChanged: (value) => _funFilter(value),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: "Pesquisar",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: Icon(Icons.search, color: Colors.black38,),
                  labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black38)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black38)),
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(padding: EdgeInsets.fromLTRB(20, 0, 20, 0), child: Divider(color: Colors.black38,endIndent: 5)),
            Expanded(
                child: ListView.builder(
                    itemCount: _foundlist.length,
                    padding: EdgeInsets.fromLTRB(40, 7, 40, 10),
                    itemBuilder: (context, index) => Card(
                          color: Colors.grey[200],
                          elevation: 5,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading:Text(
                              "${_foundlist[index]["id"]}  |",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                fontFamily: 'Roboto'
                              ),
                            ) ,
                            title: Text(
                              _foundlist[index]["title"].toString().toUpperCase(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Roboto'
                              ),
                            ),
                            subtitle: Text(
                              _foundlist[index]['description'].toString().replaceRange(30, null, "...")
                            ),
                            onTap: () {
                              String title = _foundlist[index]["title"];
                              String description = _foundlist[index]["description"];
                              Navigator.of(context).pushNamed('t4', arguments:{"title": title, "description": description} );
                            },
                          ),
                        )),
              ),
              SizedBox(height: 30,)
          ]),

      ),
    );
  }
}
