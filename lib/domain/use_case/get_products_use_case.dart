import 'package:either_dart/either.dart';
import 'package:elevate_task/data/Failures.dart';
import 'package:elevate_task/domain/repository/repository/product_list_repository_contract.dart';

import '../entities/ProductResponseEntity.dart';

class GetProductsUseCase{
  ProductListRepositoryContract repositoryContract;
  GetProductsUseCase({required this.repositoryContract});
  Future<Either<Failures, ProductsResponseEntity>>invoke(){
    return repositoryContract.getProducts();
  }
}