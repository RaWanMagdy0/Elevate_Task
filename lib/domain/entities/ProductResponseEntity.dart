class ProductsResponseEntity {
  ProductsResponseEntity({
    this.products,
    this.message
  });

  List<ProductsEntity>? products;
  String?message;

}

class ProductsEntity {
  ProductsEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RatingResponseEntity? rating;
}

class RatingResponseEntity {
  RatingResponseEntity({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

}
