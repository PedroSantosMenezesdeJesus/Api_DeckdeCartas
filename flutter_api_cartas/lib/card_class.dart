class Cards
{
  String code;
  String image;
  //String? value;
  //String? suit;
  
  Cards(
    this.code,
    this.image,
    //this.value,
   // this.suit,
  );

  Cards.empty()
    : code = '',
      image = '';

  Cards.fromJson(Map <String, dynamic> data)
    : code = data['code'] as String,
      image = data['image'] as String;
}