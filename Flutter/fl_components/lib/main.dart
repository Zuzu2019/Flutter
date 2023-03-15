import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart'; //Importa este archivo el cual determina el tema de la aplicación, es decir los colores.
import 'package:fl_components/router/app_routes.dart';//Importa todas las rutas de las ventanas creadas, para la navegacion, desde la pagina principal.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.lightTheme
    );
  }
}