import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  
    int counter = 10;

    void increase(){
      counter ++;
      setState(() {});
    }
    void decrease(){
      counter --;
      setState(() {});
    }
    void start(){
      counter = 0;
      setState(() {});
    }
  @override
  Widget build(BuildContext context) {
  const fontSize30 = TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        startFn: start,
        ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn; 
  final Function startFn;  
  const CustomFloatingActions({
    Key? key, 
    required this.increaseFn, required this.decreaseFn, required this.startFn, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        FloatingActionButton(
          child: const Icon( Icons.exposure_plus_1_outlined), 
          onPressed: () => increaseFn(),
          ),

          FloatingActionButton(
          child: const Icon( Icons.exposure_outlined), 
          onPressed: () => startFn(),
          ),

          FloatingActionButton(
          child: const Icon( Icons.exposure_minus_1_outlined), 
          onPressed: () => decreaseFn(),
          ),
      ],
      );
  }

}