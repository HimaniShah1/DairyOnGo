import 'package:dairyongo/controllers/recommended_product_controller.dart';
import 'package:dairyongo/data/api/api_client.dart';
import 'package:dairyongo/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //load api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://www.dairyongo.com"));

  //load repository
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
