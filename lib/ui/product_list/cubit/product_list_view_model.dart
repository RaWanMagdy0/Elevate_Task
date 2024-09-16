import 'package:elevate_task/domain/use_case/get_products_use_case.dart';
import 'package:elevate_task/ui/product_list/cubit/product_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/ProductResponseEntity.dart';

class ProductListViewModel extends Cubit<ProductListTabState> {
  GetProductsUseCase getProductsUseCase;
  ProductListViewModel({required this.getProductsUseCase})
      : super(ProductListTabInitialState());
  List<ProductsEntity> productList = [];

  void getProducts() async {
    emit(ProductListTabLoadingState(loadingMessage: "Loading..."));
    var either = await getProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductListTabErrorState(errors: error));
    }, (response) {
      productList = response.products ?? [];
      emit(ProductListTabSuccessState(responseEntity: response));
    });
  }
}
