import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


void creditspag() {
  runApp(
    const MaterialApp(
      title: 'Crétidos á API',
      home: CreditsPag(),
    )
  );
}

class CreditsPag extends StatefulWidget{
  const CreditsPag({super.key});

  @override  
  CreditsPAG createState() => CreditsPAG();
}

class CreditsPAG extends State{

  @override
  Widget build(BuildContext context) {

    Future<void> launchUrl() async{
      final Uri linkApi = Uri.parse('https://deckofcardsapi.com/?ref=public_apis&utm_medium=website');
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
          children: [
            RichText(

              text: TextSpan(
                text: 'Créditos para a API', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 72
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl();
                  }
              )
            ),

            Image.asset('img/cartas.png')
          ],
        ),
      ),
    );

  }
}