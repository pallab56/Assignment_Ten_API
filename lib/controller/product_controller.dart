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
}
