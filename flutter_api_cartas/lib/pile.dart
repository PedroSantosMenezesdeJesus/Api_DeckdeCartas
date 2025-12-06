import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_api_cartas/deck_class.dart';
import 'package:flutter_api_cartas/card_class.dart';

void pilepag() {
  runApp(
    const MaterialApp(
      title: 'Pilha de Cartas',
      home: PilePag(),
    )
  );
}

class PilePag extends StatefulWidget{
  const PilePag({super.key});

  @override
  PilePAG createState() => PilePAG();
}

class PilePAG extends State{

  bool deckVisivel = false;
  bool erroVisivel = false;
  Deck deck = Deck.empty();
  
  List<Cards> card = List.empty(growable: true);

  Future<void> getDeck() async {
    try {
      var url = "https://deckofcardsapi.com/api/deck/new/";
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        deck.id = responseData['deck_id'] as String;
        deck.sucess = responseData['success'] as bool;
        deck.shuffled = responseData['shuffled'] as bool;
        deck.remaning = responseData['remaining'] as int;

        if(deck.id != null) {     
          print(deck.id);
          print(deck.sucess);
          print(deck.shuffled);
          print(deck.remaning);

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

Future<void> getAddPiles() async {
    try {
      var url = "https://deckofcardsapi.com/api/deck/${deck.id}/pile/pilhas/add/?cards=AS,2S";
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        deck.id = responseData['deck_id'] as String;
        deck.sucess = responseData['success'] as bool;
        deck.shuffled = responseData['shuffled'] as bool;
        deck.remaning = responseData['remaining'] as int;

        if(deck.id != null) {     
          print(deck.id);
          print(deck.sucess);
          print(deck.shuffled);
          print(deck.remaning);

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

Future<void> getShufflePile() async {
    try {
      var url = "https://deckofcardsapi.com/api/deck/${deck.id}/pile/pilhas/shuffle/";
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

  Future<void> getListCardsPiles() async {
    try {
      var url = "https://deckofcardsapi.com/api/deck/${deck.id}/pile/pilhas/list/";
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        deck.id = responseData['deck_id'] as String;
        deck.sucess = responseData['success'] as bool;
        deck.shuffled = responseData['shuffled'] as bool;
        deck.remaning = responseData['remaining'] as int;

        if(deck.id != null) {     
          print(deck.id);
          print(deck.sucess);
          print(deck.shuffled);
          print(deck.remaning);

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

  Future<void> getDrawPiles() async {
    try {
      var url = "https://deckofcardsapi.com/api/deck/${deck.id}/pile/pilhas/draw/random/";
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        

        deck.id = responseData['deck_id'] as String;
        deck.sucess = responseData['success'] as bool;
        deck.shuffled = responseData['shuffled'] as bool;
        deck.remaning = responseData['remaining'] as int;

        if(deck.id != null) {     
          print(deck.id);
          print(deck.sucess);
          print(deck.shuffled);
          print(deck.remaning);

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
  void initState() {
    super.initState();
    getDeck();
  }


  @override
  Widget build(BuildContext context) { 

    final ScrollController controle = ScrollController();

    return Scaffold(

      backgroundColor: Color.fromRGBO(48, 136, 52, 1),

      appBar: AppBar(
        title: Text('Pilha de Cartas'),
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
                            onPressed: getAddPiles, 
                            label: const Text('Adicionar à pilha', style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
                          ),
                        ),
                  
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon (
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                              fixedSize: WidgetStatePropertyAll<Size>(Size(150, 50))
                            ),
                            onPressed: getShufflePile, 
                            label: const Text('Embaralhar pilha', style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
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
                            onPressed: getListCardsPiles, 
                            label: const Text('Listar cartas nas pilhas', style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon (
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.black12),
                              fixedSize: WidgetStatePropertyAll<Size>(Size(150, 50))
                            ),
                            onPressed: getDrawPiles, 
                            label: const Text('Comprar das pilhas', style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
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
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('img/cartas.png', scale: 1, fit: BoxFit.fitWidth,),
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