import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const fontSize30 = TextStyle(fontSize: 30);
    int counter = 10;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Numero de clicks', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon (Icons.add),
        onPressed: () {
          counter ++;
          print('Hola: $counter');
        }
      ),
    );
  }

}