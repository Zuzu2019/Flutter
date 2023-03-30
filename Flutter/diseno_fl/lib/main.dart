
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:diseno_fl/screens/basic_design.dart';
import 'package:diseno_fl/screens/scroll_design.dart';
import 'package:diseno_fl/screens/home_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark(),
      initialRoute: 'home_screen',
      routes: {
        'basic_design' : ( _ ) => BasicDesignScreen(),
        'scroll_screen': ( _ ) => ScrollScreen(), 
        'home_screen'  : ( _ ) => HomeScreen(), 
      },
    );
  }
}