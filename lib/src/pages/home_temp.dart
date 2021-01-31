import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['1', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(children: _crearItemsFormaRapida()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> Lista = new List<Widget>();

    for (String opt in opciones) {
      final widgetTemp = ListTile(
        title: Text(opt),
      );

      Lista..add(widgetTemp)..add(Divider());
      /*Es lo mismo que 
      Lista.add(widgetTemp);
      Lista.add(Divider());
      */
    }

    return Lista;
  }

  List<Widget> _crearItemsFormaRapida() {
    return opciones.map((e) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(e + '!'),
            subtitle: Text('Cualquier Cosa'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.add_alarm_sharp),
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
