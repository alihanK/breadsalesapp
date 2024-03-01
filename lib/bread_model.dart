class Bread {
  String name;
  String price;
  String imagePath;
  String rating;

  Bread(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.rating});

  String get _name => name;
  String get _price => price;
  String get _imagePath => _imagePath;
  String get _rating => rating;
}
