import 'package:either_dart/src/either.dart';
import 'package:elevate_task/data/Failures.dart';
import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/domain/entities/ProductResponseEntity.dart';
import 'package:elevate_task/domain/repository/data_source/product_list_remote_data_source.dart';

class ProductListDataSourceImpl implements ProductListRemoteDataSource {
  ApiManager apiManager;
  ProductListDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures,ProductsResponseEntity>> getProducts() async {
    var either = await apiManager.getProducts();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}
