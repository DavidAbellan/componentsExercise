import 'package:flutter/material.dart';
import '../providers/opt_provider.dart';

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
    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: Icon(
          Icons.ac_unit_sharp,
          color: Colors.blue,
        ),
        onTap: () {},
      );
      opciones.add(widgetTemp);
      opciones.add(Divider());
    });

    return opciones;
  }
}
