import 'package:elevate_task/data/Failures.dart';

import '../../../domain/entities/ProductResponseEntity.dart';

abstract class ProductListTabState{}
class ProductListTabInitialState extends ProductListTabState{}
class ProductListTabErrorState extends ProductListTabState{
Failures errors;
ProductListTabErrorState({required this.errors});
}
class ProductListTabLoadingState extends ProductListTabState{
  String loadingMessage;
  ProductListTabLoadingState({required this.loadingMessage});
}
class ProductListTabSuccessState extends ProductListTabState{
  //response
  ProductsResponseEntity responseEntity;
  ProductListTabSuccessState({required this.responseEntity});
}