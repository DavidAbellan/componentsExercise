import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página del Avatar"),
        actions: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spiderman-3-argumento-fecha-estreno-1597218122.jpg?crop=1.00xw:0.668xh;0,0.163xh&resize=640:*'),
              radius: 20.0,
            ),
            margin: EdgeInsets.only(right: 3.0),
          ),
          //lo rodeamos de un container para poder añadirle margen
          Container(
            child: CircleAvatar(
              child: Text('DM'),
              backgroundColor: Colors.brown,
            ),
            margin: EdgeInsets.only(right: 10.0),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://depor.com/resizer/dEjgKefPPP6bCtg2YxSunUQ3IxE=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/G2NXDWLBLRHH3DJA2JNMRTXKGY.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(seconds: 3),
        ),
      ),
    );
  }
}
