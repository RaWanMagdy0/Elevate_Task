import 'package:either_dart/src/either.dart';
import 'package:elevate_task/data/Failures.dart';
import 'package:elevate_task/domain/repository/data_source/product_list_remote_data_source.dart';
import 'package:elevate_task/domain/repository/repository/product_list_repository_contract.dart';

import '../../../domain/entities/ProductResponseEntity.dart';

class ProductListRepositoryImpl implements ProductListRepositoryContract{
  ProductListRemoteDataSource remoteDataSource;
  ProductListRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, ProductsResponseEntity>> getProducts() {
    return remoteDataSource.getProducts();
  }
}