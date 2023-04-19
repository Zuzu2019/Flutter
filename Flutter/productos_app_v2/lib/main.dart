import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app_v2/screens/screens.dart';
import 'package:productos_app_v2/services/services.dart';

 
void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
        ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
      ],
      child: MyApp(),
    );
  }
}



 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        
        'checking': ( _ ) => CheckAuthScreen(),

        'home'    : ( _ ) => HomeScreen(),
        'product' : ( _ ) => ProductScreen(),

        'login'   : ( _ ) => LoginScreen(),
        'register': ( _ ) => RegisterScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Color.fromARGB(255, 5, 95, 95)
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 7, 117, 112),
          elevation: 0
        )
      ),
    );
  }
}