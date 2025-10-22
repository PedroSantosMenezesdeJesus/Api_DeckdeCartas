import 'package:flutter/material.dart';

void deckpag() {
  runApp(
    const MaterialApp(
      title: 'Deck de Cartas',
      home: DeckPag(),
    )
  );
}

class DeckPag extends StatefulWidget{
  const DeckPag({super.key});

  @override
  DeckPAG createState() => DeckPAG();
}

class DeckPAG extends State{
  @override
  Widget build(BuildContext context) {

    final ScrollController controle = ScrollController();

    return Scaffold(
      body: Center(
        child: Scrollbar(

          trackVisibility: true,
          thumbVisibility: true,
          thickness: 10,
          radius: const Radius.circular(20),
          interactive: true,

          child: ListView.builder(
            controller: controle,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,


                decoration: BoxDecoration(
                  color: Color.fromRGBO(48, 136, 52, 1),
                  borderRadius: BorderRadius.circular(16)
                ),    

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,

                  children: [
                    Row(
                      children: [
                        
                      ],
                    )
                  ],
                ),
              );
            }
          )
        ),
      ),
    );
  }
}