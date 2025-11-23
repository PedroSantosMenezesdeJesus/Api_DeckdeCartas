import 'package:flutter/material.dart';

import 'package:flutter_api_cartas/deck.dart';
import 'package:flutter_api_cartas/pile.dart';
import 'package:flutter_api_cartas/credits.dart';

void main() {
  runApp(const MaterialApp(title: 'Deck de Cartas',
  home: MainApp()));
}

class MainApp extends StatefulWidget{
  const MainApp({super.key});

  @override
  MainAPP createState() => MainAPP();
}

class MainAPP extends State {

  final List<Widget> pages = 
  [
    DeckPag(),
    PilePag(),
    CreditsPag(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },

          items: 
          [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.crop_square, color: Colors.red,),
              label: 'Deck de Cartas'
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.grid_on, color: Colors.red,),
              label: 'Pilha de Cartas'
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.text_snippet, color: Colors.red,),
              label: 'Créditos API'
            ),
          ]
        ),

        body: pages[currentPage]
      ),
    );
  }
}
