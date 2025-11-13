import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api_cartas/deck_class.dart';

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

  bool deckVisivel = false;
  bool erroVisivel = false;
  Deck deck = Deck.empty();

  Future<void> getDeck() async {
    try {
      var url = "https://deckofcardsapi.com/api/deck/new/";
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final Map<String, dynamic>? deckData = (responseData is Map<String, dynamic>)
            ? responseData['deck_id'] as Map<String, dynamic>?
            : null;

        if(deckData != null) {
          deck = Deck.fromJson(deckData);
          setState(() {
            deckVisivel = true;
            erroVisivel = false;
          });
        } else {
          debugPrint("Erro de formato JSON: Chave 'data' faltando ou nula.");
          setState(() {
            deckVisivel = false;
            erroVisivel = true;
          });
        }
      } else {
        setState(() {
          deckVisivel = false;
          erroVisivel = true;
        });
      } 
    } catch (e) {
      debugPrint('Erro na requisição ou processamento: $e');
      setState(() {
        deckVisivel = false;
        erroVisivel = true;
      });
    }
  }

Future<void> getReshuffleDeck() async {
    try {
      var url = "https://deckofcardsapi.com/api/deck/<<deck_id>>/shuffle/?remaining=true";
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final Map<String, dynamic>? deckData = (responseData is Map<String, dynamic>)
            ? responseData['deck_id'] as Map<String, dynamic>?
            : null;

        if(deckData != null) {
          deck = Deck.fromJson(deckData);
          setState(() {
            deckVisivel = true;
            erroVisivel = false;
          });
        } else {
          debugPrint("Erro de formato JSON: Chave 'data' faltando ou nula.");
          setState(() {
            deckVisivel = false;
            erroVisivel = true;
          });
        }
      } else {
        setState(() {
          deckVisivel = false;
          erroVisivel = true;
        });
      } 
    } catch (e) {
      debugPrint('Erro na requisição ou processamento: $e');
      setState(() {
        deckVisivel = false;
        erroVisivel = true;
      });
    }
  }

  


  @override
  Widget build(BuildContext context) {

    final ScrollController controle = ScrollController();

    return Scaffold(

      backgroundColor: Color.fromRGBO(48, 136, 52, 1),

      appBar: AppBar(
        title: Text('Deck de Cartas'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(48, 136, 52, 1),
      ),

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,

                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon (
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.black12),
                              fixedSize: WidgetStatePropertyAll<Size>(Size(150, 50))
                            ),
                            onPressed: getDeck, 
                            label: const Text('Criar Deck', style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
                          ),
                        ),
                  
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon (
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                              fixedSize: WidgetStatePropertyAll<Size>(Size(150, 50))
                            ),
                            onPressed: getReshuffleDeck, 
                            label: const Text('Embaralhar Deck', style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
                          ),
                        ),  

                      ],
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon (
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                              fixedSize: WidgetStatePropertyAll<Size>(Size(150, 50))
                            ),
                            onPressed: getDeck, 
                            label: const Text('Compre mais de uma carta', style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon (
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.black12),
                              fixedSize: WidgetStatePropertyAll<Size>(Size(150, 50))
                            ),
                            onPressed: getDeck, 
                            label: const Text('Retornar cartas ao Deck', style: TextStyle(color: Colors.white,), textAlign: TextAlign.center)
                          ),
                        ),       
                      ],
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: erroVisivel,
                        child: Column(
                          children: [
                            Icon(Icons.error, color: Colors.red.shade700, size: 48),
                            const SizedBox(height: 12),
                            Text("Falha na requisição. Tente novamente.", textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: deckVisivel,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network('https://deckofcardsapi.com/static/img/back.png'),
                                //Image.network(src)
                              ],
                            )
                          ],
                        ),
                      ),
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