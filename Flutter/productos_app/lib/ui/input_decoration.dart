
import 'package:flutter/material.dart';

class InputDecorations {


  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }){

    

             return  InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple
                  )
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                    width: 2
                    ) 
                  ),
                  hintText: hintText,
                  labelText: labelText,
                  labelStyle: const TextStyle(
                    color: Colors.white10
                  ),
                  prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: Colors.black,)
                  : null
              );
  }
} 