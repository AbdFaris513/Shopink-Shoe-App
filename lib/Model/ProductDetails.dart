class ProductDetails {
  int id;
  String name;
  String gender;
  int buyingCount;
  double price;
  List<dynamic> size;
  List<dynamic> img;
  String discripstion;
  double rating;
  bool favorite;
  int selectedQuantity;

  ProductDetails({
    required this.id,
    required this.name,
    required this.gender,
    required this.price,
    required this.size,
    required this.img,
    required this.discripstion,
    required this.rating,
    required this.buyingCount,
    this.favorite = false,
    this.selectedQuantity = 1,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json['id'] ?? '0',
        name: json['name'].toString() ?? '-',
        gender: json['gender'].toString() ?? '-',
        price: json['price'] ?? '0',
        size: json['size'].isNotEmpty ? json['size'] : [],
        img: json['img'].isNotEmpty ? json['img'] : [],
        discripstion: json['discripstion'].toString() ?? '-',
        rating: json['rating'] ?? 0,
        buyingCount: json['buyingCount'] ?? 0,
        favorite: json['favorite'] ?? true,
        selectedQuantity: json['selectedQuantity'] ?? 0,
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'price': price,
        'size': size,
        'img': img,
        'discripstion': discripstion,
        'rating': rating,
        'buyingCount': buyingCount,
        'favorite': favorite,
        'selectedQuantity': selectedQuantity,
      };
}
