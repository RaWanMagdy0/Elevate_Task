import 'package:elevate_task/data/di.dart';
import 'package:elevate_task/ui/product_list/cubit/product_list_states.dart';
import 'package:elevate_task/ui/product_list/cubit/product_list_view_model.dart';
import 'package:elevate_task/utils/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/my_app_color.dart';

class ProductListTab extends StatefulWidget {
  static const String routeName = 'ProductListTab';

  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  ProductListViewModel viewModel =
      ProductListViewModel(getProductsUseCase: injectGetProductsUseCase());

  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListViewModel, ProductListTabState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state is ProductListTabLoadingState?
                  const Center(
                    child: CircularProgressIndicator(
                      color: MyAppColor.primaryColor,
                    ),
                  )
                 : Expanded(
                          child: GridView.builder(
                              itemCount: viewModel.productList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16.w,
                                      mainAxisSpacing: 16.h,
                                      childAspectRatio: 2 / 2.4),
                              itemBuilder: (context, index) {
                                return Material(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onTap: () {},
                                    child: ProductListItem(
                                      responseEntity:
                                          viewModel.productList[index],
                                    ),
                                  ),
                                );
                              }))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
