import 'card_class.dart';

class Piles
{
  List<dynamic> pilhas;
  int remaining;
  List<Cards> cartas = [];

  Piles(
    this.pilhas,
    this.remaining,
    this.cartas
  );

  Piles.empty() 
    : pilhas = [],
      remaining = 0,
      cartas = [];

  Piles.fromJson(Map<String, dynamic> data)
    : pilhas = data['pilhas'] as List<dynamic>,
      remaining = data['remaining'] as int,
      cartas = data['cards'] as List<Cards>;
}