import 'package:componentes/src/pages/animatde_container.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => HomePage(),
    'alert': (context) => AlertPage(),
    'avatar': (context) => AvatarPage(),
    'card': (context) => CardPage(),
    'animatedContainer': (context) => AnimatedContainerPage(),
    'inputs': (context) => InputPage(),
    'slider': (context) => SliderPage(),
    'list': (context) => ListaPage()
  };
}
