class Cards
{
  String? code;
  String? image;
  
  Cards({
    this.code,
    this.image,
  });

  Cards.empty()
    : code = '',
      image = '';

  Cards.fromJson(Map <String, dynamic> data)
    : code = data['code'] as String?,
      image = data['image'] as String?;
}