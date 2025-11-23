import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void creditspag() {
  runApp(CreditsPag());
}

class CreditsPag extends StatelessWidget{
  const CreditsPag({super.key});

  @override
  Widget build(BuildContext context) {

    Future<void> ApiUrl() async{
      final Uri apiUrl = Uri.parse('https://deckofcardsapi.com/?ref=public_apis&utm_medium=website');
      if (!await launchUrl(apiUrl)) {
        throw Exception('Não pode mostrar $apiUrl');
      }
    }


    return Scaffold(

      backgroundColor: Color.fromRGBO(48, 136, 52, 1),

      appBar: AppBar(
        title: Text('Créditos para a API'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(48, 136, 52, 1),
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,

          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: ApiUrl,
                child: Text('Créditos para API', style: TextStyle(color: Colors.blue, fontSize: 48),textAlign: TextAlign.center)
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('img/cartas.png', alignment: Alignment.bottomCenter,),
            )
          ],
        ),
      ),
    );

  }
}