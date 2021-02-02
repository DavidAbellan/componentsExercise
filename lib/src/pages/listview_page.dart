import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //para controlar el scroll
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  //dispose para desechar el listener cuando se abanadona la página
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  //inicializar para evitar que listanumeros sea null
  //primero en el ciclo de vida , llamado con hot restart
  void initState() {
    super.initState();
    _agregarDiez();
    //listener para el scroll
    _scrollController.addListener(() {
      //si el scroll ha llegado a la final de la página
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregarDiez();

        //para una petición que puede tener delay
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      //Stack apila columnas y Row
      body: Stack(
        children: [_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPaginaUno,
      //para renderizar numero indeterminado de elementos

      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$imagen'));
        },
        itemCount: _listaNumeros.length,
      ),
    );
  }

  void _agregarDiez() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final _duration = new Duration(seconds: 2);
    return new Timer(_duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(seconds: 2));
    //no hacemos setState porque ya lo hicimos en el scrollController
    _isLoading = false;
    _agregarDiez();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> obtenerPaginaUno() async {
    final Duration delay = new Duration(seconds: 2);
    new Timer(delay, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiez();
    });
    return Future.delayed(delay);
  }
}
