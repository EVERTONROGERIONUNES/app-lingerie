import 'package:agenda_contatos/pages/custom_drawer.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
//PageController -> controlador de páginas acessadas
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
//acessando o arquivo do Menu Lateral
            drawer: CustomDrawer(),
//barra de título do app
            appBar: AppBar(
              title: const Text("Menu"),
            ),
            body: ListView(children: <Widget>[
              Container(
                width: 2040,
                height: 1080,
                color: Colors.black87,
                child: Center(
                  child: Image.asset("img/teste.png"),
                ),
              ),
            ])),
      ],
    );
  }
}
