import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards-Tarjetas'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        //EdgeInsets.symmetric(horizontal:50.0,vertical:10.0)

        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Título'),
            subtitle: Text(
                'Barça es otro, un equipo que poco tiene que ver con el que'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () => {}, child: Text('Cancelar')),
              FlatButton(onPressed: () => {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //Si clip Antialias no funciona reodearlo con un container
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(seconds: 3),
              fit: BoxFit.cover,
              height: 300.0,
              image: NetworkImage(
                  'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip')),

          /*Image(
            image: NetworkImage(
                'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip'),
          ),*/
          Container(
            child: Text('Pachamama'),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20.0),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 16.0)),
          ]),
    );
  }
}
