import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagina Alert")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
