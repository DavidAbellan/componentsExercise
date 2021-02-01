import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagina Alert")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
    );
  }

  void _mostrarAlerta(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Alerta Lanzada'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de la caja de alerta'),
                FlutterLogo(size: 100.0),
                FlatButton(
                    //navigator of context.... para cerrar la alerta
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancelar'))
              ],
            )));
  }
}
