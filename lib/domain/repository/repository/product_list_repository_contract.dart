import 'package:either_dart/either.dart';
import '../../../data/Failures.dart';
import '../../entities/ProductResponseEntity.dart';

abstract class ProductListRepositoryContract{
  Future<Either<Failures,ProductsResponseEntity>>getProducts();

}