class Product {
  final String name;
  final double weight;
  final String color;
  final int stockQuantity;

  Product({
    required this.name,
    required this.weight,
    required this.color,
    required this.stockQuantity,
  });

  // Methode pour convertir un objet Product en un Map pour l'insertion dans la base
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'weight': weight,
      'color': color,
      'stockQuantity': stockQuantity
    };
  }

  // Constructeur alternatif pour créer un objet Product à partir d'un Map (récupération depuis la base de donnée)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'],
        weight: map['weight'],
        color: map['color'],
        stockQuantity: map['stockQuantity']);
  }
}
