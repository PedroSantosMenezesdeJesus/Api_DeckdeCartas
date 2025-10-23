import 'package:flutter_api_cartas/card_class.dart';

class Deck 
{
  String? id;
  bool? sucess;
  bool? shuffled;
  int? remaning;
  List<Cards>? cards;

  Deck({
    this.id,
    this.sucess,
    this.shuffled,
    this.remaning,
    this.cards,
  });

  Deck.empty()
    : id = '',
      sucess = true,
      shuffled = true,
      remaning = 0,
      cards = [];

  Deck.fromJson(Map <String, dynamic> data)
    : id = data['deck_id'] as String?,
      sucess = data['success'] as bool?,
      shuffled = data['shuffled'] as bool?,
      remaning = data['remaining'] as int?,
      cards = data['cards'] as List<Cards>?;
}