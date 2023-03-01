import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lenguaje oculto del amar'),
        actions: [
          Container(
            margin: const EdgeInsets.only( right: 5),
            child: CircleAvatar(
              child: const Text('S'),
              backgroundColor: Color.fromARGB(255, 26, 49, 126)
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
           maxRadius: 150,
           backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/001/967/276/original/young-beautiful-couple-dancing-while-standing-against-white-background-free-vector.jpg'),
         )
      ),
    );
  }
}