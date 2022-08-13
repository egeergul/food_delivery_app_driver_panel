import 'package:dofd_driver_panel/controllers/all_orders_controller.dart';
import 'package:dofd_driver_panel/controllers/auth_controller.dart';
import 'package:dofd_driver_panel/controllers/cart_controller.dart';
import 'package:dofd_driver_panel/controllers/location_controller.dart';
import 'package:dofd_driver_panel/controllers/order_detail_controller.dart';
import 'package:dofd_driver_panel/controllers/popular%20_product_controller.dart';
import 'package:dofd_driver_panel/controllers/user_controller.dart';
import 'package:dofd_driver_panel/data/repository/all_orders_repo.dart';
import 'package:dofd_driver_panel/data/repository/auth_repo.dart';
import 'package:dofd_driver_panel/data/repository/cart_repo.dart';
import 'package:dofd_driver_panel/data/repository/location_repo.dart';
import 'package:dofd_driver_panel/data/repository/order_detail_repo.dart';
import 'package:dofd_driver_panel/data/repository/popular_product_repo.dart';
import 'package:dofd_driver_panel/data/repository/user_repo.dart';
import 'package:dofd_driver_panel/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/recommended_food_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/recommended_food_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // api
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => AllOrdersRepo(apiClient: Get.find()));
  Get.lazyPut(() => OrderDetailRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => AllOrdersController(allOrdersRepo: Get.find()));
  Get.lazyPut(() => OrderDetailController(orderDetailRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
