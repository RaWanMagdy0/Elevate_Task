import 'package:either_dart/either.dart';
import 'package:elevate_task/data/Failures.dart';
import '../../entities/ProductResponseEntity.dart';

abstract class ProductListRemoteDataSource {
  Future<Either<Failures,ProductsResponseEntity>>getProducts();
}