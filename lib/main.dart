import 'package:agenda_contatos/pages/splash_screen.dart';
import 'package:agenda_contatos/ui/contact_page.dart';
import 'package:agenda_contatos/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '<Atrevida Lingerie>', //..escolha o nome nessa

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.purple, //..troca a cor nessa linha
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //home: Container(),
      home: Splash(),
    );
  }
}
