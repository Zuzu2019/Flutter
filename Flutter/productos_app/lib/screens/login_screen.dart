

import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:productos_app/ui/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  //const name({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Authbackground(
        child: SingleChildScrollView(
         child: Column(
          children: [
            const SizedBox(height: 260),
            CardContainer(
              child: Column (
                children: [
                  SizedBox(height: 10),
                  Text('Login', style: Theme.of(context).textTheme.headline4,),
                  SizedBox(height: 10),

                  // ChangeNotifierProvider(
                  //   create: ( _ ) => LoginFormProvider(),
                  //   child: formulario()
                  // ),

                  formulario()
                ],
                )
            ),

                  SizedBox(height: 10),
                  Text('Crear cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),


          ]
          ),
        ),
      )
    );
  }
}

class formulario extends StatelessWidget {
  //const formulario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form (
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'azuflor@gmail.com',
                labelText: 'Email',
                prefixIcon: Icons.email
              ),
              validator: ( value ) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Caracteres incorrrectos';

              },
            ),
            SizedBox(height: 20),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '********',
                labelText: 'Password',
                prefixIcon: Icons.password_outlined,
              ),
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';                                    
                  
              },

              
            ),

            SizedBox(height: 20),


            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.green,
              elevation: 0,
              color: Color.fromARGB(255, 5, 125, 81),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: (){}
              )
          ]
          ),
        )
    );
  }
}