import 'package:flutter/material.dart';

class Authbackground extends StatelessWidget {
 // const name({super.key});

 final Widget child;

  const Authbackground({
    super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromARGB(255, 246, 246, 246),
      width: double.infinity,
      height: double.infinity,

      child: Stack(
        children: [
          _GreenBox(),

          HeaderIcon(),
          this.child,

        ]
        ),

    );
  }
}

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _GreenBox extends StatelessWidget {
  //const name({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      //color: Color.fromARGB(255, 38, 101, 86),
      decoration: _greenBackground(),
    );
  }

  BoxDecoration _greenBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 38, 101, 86),
        Color.fromARGB(255, 64, 200, 169),
      ]
      )
  );
}