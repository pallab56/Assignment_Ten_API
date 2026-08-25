class ApiUrl {
  static String baseUrl = 'https://crud-api-ostad-live.onrender.com/api/v1';
  static String readProductUrl = '$baseUrl/ReadProduct';
  static String createProductUrl = '$baseUrl/CreateProduct';
  static String updateProductByIdUrl(String productId) => '$baseUrl/UpdateProduct/$productId';
  
  static String deleteProductByIdUrl(String productId) => '$baseUrl/DeleteProduct/$productId';
}
