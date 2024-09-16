import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import 'package:elevate_task/data/Failures.dart';
import 'package:elevate_task/data/api/api_const.dart';
import 'package:http/http.dart' as http;

import '../model/response/ProductResponseDto.dart';


class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, ProductsResponseDto>> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getProductListApi);
      var response = await http.get(url);
      var productResponse =
      ProductsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //success
        return Right(productResponse);
      } else {
        return Left(ServerError(
          errorMessage: productResponse.message,
        ));
      }
    } else {
      return Left(NetworkError(
        errorMessage: 'Check Internet Connection',
      ));
    }
  }
}
