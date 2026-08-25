import 'dart:convert';

import 'package:assignment10/model/product_model.dart';
import 'package:assignment10/utils/api_url.dart';
import 'package:http/http.dart' as http;

class ProductController {
  List<Data> products = [];
  Future<void> getProducts() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl.readProductUrl));
      print(response);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final model = ProductModel.fromJson(jsonResponse);
        products = model.data ?? [];
        print(products);
      } else {
        throw 'Failed to load Data ${response.statusCode}';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> createProduct(Data data) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.createProductUrl),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "ProductName": data.productName,
          "ProductCode": data.productCode,
          "Img": data.img,
          "Qty": data.qty,
          "UnitPrice": data.unitPrice,
          "TotalPrice": data.totalPrice,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        getProducts();
      } else {
        throw "Something went wrong ${response.statusCode}";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> editProduct(Data data, String productId) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.updateProductByIdUrl(productId)),

        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "ProductName": data.productName,
          "ProductCode": data.productCode,
          "Img": data.img,
          "Qty": data.qty,
          "UnitPrice": data.unitPrice,
          "TotalPrice": data.totalPrice,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        getProducts();
      } else {
        throw 'something went wrong ${response.statusCode}';
      }
      {}
    } catch (e) {
      throw e.toString();
    }
  }
}
