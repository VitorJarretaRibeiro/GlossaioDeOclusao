import 'package:flutter/material.dart';

import '../widgets/custom_item_drawer_widgets.dart';
import '../widgets/custom_visual_drawer_widgets.dart';

class TechnicalTermScreen extends StatefulWidget {
  const TechnicalTermScreen({super.key});

  @override
  State<TechnicalTermScreen> createState() => _TechnicalTermScreenState();
}

class _TechnicalTermScreenState extends State<TechnicalTermScreen> {
  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context)!.settings.arguments as String;
    var description = ModalRoute.of(context)!.settings.arguments as String;

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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
             title,
             style: TextStyle(
              color: Color.fromRGBO(25, 191, 195, 1),
              fontSize: 32
             ),
            )
          ],
        ),
      )
    ));
  }
}
