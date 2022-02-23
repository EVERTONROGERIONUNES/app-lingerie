import 'package:agenda_contatos/ui/home_page.dart';
import 'package:agenda_contatos/ui/home_page_cliente.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("evertonrogerionunes@gmail.com"),
            accountName: Text("Everton Rogerio Nunes"),
            currentAccountPicture: CircleAvatar(
              child: Text("EN"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Clientes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePageCliente()),
              );
              //Navegar para outra página
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text("Fornecedores"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              //Navegar para outra página
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favoritos"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
        ],
      ),
    );
  }
}
