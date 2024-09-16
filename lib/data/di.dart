import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/data/repository/data_source/product_list_data_source_impl.dart';
import 'package:elevate_task/data/repository/repository/product_list_repository_impl.dart';
import 'package:elevate_task/domain/repository/data_source/product_list_remote_data_source.dart';
import 'package:elevate_task/domain/repository/repository/product_list_repository_contract.dart';
import 'package:elevate_task/domain/use_case/get_products_use_case.dart';

ProductListRepositoryContract injectProductListRepositoryContract(){
  return ProductListRepositoryImpl(remoteDataSource: injectProductListRemoteDataSource());
}
ProductListRemoteDataSource injectProductListRemoteDataSource(){
  return ProductListDataSourceImpl(apiManager: ApiManager.getInstance());
}
GetProductsUseCase injectGetProductsUseCase(){
  return GetProductsUseCase(repositoryContract: injectProductListRepositoryContract());
}