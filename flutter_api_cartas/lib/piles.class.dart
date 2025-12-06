//import 'package:flutter/material.dart';

class Piles
{
  List<dynamic> pilhas;
  int remaining;

  Piles(
    this.pilhas,
    this.remaining
  );

  Piles.empty() 
    : pilhas = [],
      remaining = 0;

  Piles.fromJson(Map<String, dynamic> data)
    : pilhas = data['pilhas'] as List<dynamic>,
      remaining = data['remaining'] as int;
}