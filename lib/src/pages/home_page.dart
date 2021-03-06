import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter/material.dart';
import '../providers/opt_provider.dart';
import '../utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /*menuProvider.cargarData().then((value) {
      print("LIISTA");
      print(value);
    });*/
    ////Future Builder ////////////
    ///Para resolver futures(promesas)/////

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    ///PROBLEMAS que yo no tengo con el forEach solucion
    ///por que tengo initalData inicializado a [ arriba
    if (opciones == null) {
      return [];
    }
    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
          //rutas tienen que estar definidas en el build de materialApp
          //en  APP o main

          /*final route = MaterialPageRoute(builder: (context) {
            return AlertPage();
          });
          Navigator.push(context, route);*/
        },
      );

      opciones.add(widgetTemp);
      opciones.add(Divider());
    });

    return opciones;
  }
}
