import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //para cambiar los idiomas soportados
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('es', 'ES')],

      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      //refactorizamos las rutas en el archivo routes/routes.dart para cuando
      //sean muchas
      /*  routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        'alert': (context) => AlertPage(),
        'avatar': (context) => AvatarPage()
      },*/
      routes: getApplicationRoutes(),
      //para rutas que no están definidas o no existen
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
