import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final Widget child;


  const CardContainer(
    {super.key, 
    required Column this.child,}
    );

  


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        //height: 300,
        decoration: crearcard(),
        child: this.child,
        
      ),
    );
  }

  BoxDecoration crearcard() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,10)
      )
      
    ]
  );
}