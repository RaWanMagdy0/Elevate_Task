import 'package:elevate_task/domain/entities/ProductResponseEntity.dart';

class ProductsResponseDto extends ProductsResponseEntity {
  ProductsResponseDto({
    super.products,
  });

  ProductsResponseDto.fromJson(List<dynamic> json) {
    products = json.map((e) => ProductsDto.fromJson(e)).toList();
  }
}

class ProductsDto extends ProductsEntity {
  ProductsDto({
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
    super.rating,
  });

  ProductsDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num).toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null
        ? RatingResponseDto.fromJson(json['rating'])
        : null;
  }
}

class RatingResponseDto extends RatingResponseEntity {
  RatingResponseDto({
    super.rate,
    super.count,
  });

  RatingResponseDto.fromJson(Map<String, dynamic> json) {
    rate = (json['rate'] as num).toDouble();
    count = json['count'];
  }
}
