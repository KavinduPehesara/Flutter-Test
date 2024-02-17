class Note {
  final String thumbnails;
  final String title;
  final String price;
  final String brand;

  const Note({
    required this.thumbnails,
    required this.title,
    required this.price,
    required this.brand,
  });

  static Note fromJson(json) => Note(
        thumbnails: json['thumbnails'],
        title: json['title'],
        price: json['price'],
        brand: json['brand'],
      );
}
