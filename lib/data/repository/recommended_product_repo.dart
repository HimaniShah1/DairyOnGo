import 'package:dairyongo/data/api/api_client.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  //method that will send response from the server
  //repo calls a method from the api client
  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData("http://www.dairyongo.com");
  }
}
