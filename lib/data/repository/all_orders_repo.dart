import 'package:dofd_driver_panel/data/api/api_client.dart';
import 'package:dofd_driver_panel/utils/app_constants.dart';
import 'package:get/get.dart';

class AllOrdersRepo extends GetxService {
  final ApiClient apiClient;

  AllOrdersRepo({required this.apiClient});

  Future<Response> getAllOrdersList() async {
    return await apiClient.getData(AppConstants.ALL_ORDERS_URI);
  }

  Future<Response> markAsDelivered(DateTime date, String orderId) async {
    Response r = await apiClient.patchData(
        AppConstants.ALL_ORDERS_MARK_AS_DELIVERED,
        {"delivered": date.toString(), "id": orderId});
    return r;
  }

  Future<Response> getOrderDetail(int orderId) async {
    Response r =
        await apiClient.getData('${AppConstants.ORDER_DETAIL}/${orderId}');
    return r;
  }

  Future<Response> getProductDetail(int productId) async {
    Response r =
        await apiClient.getData('${AppConstants.PRODUCT_DETAIL}/${productId}');
    return r;
  }
}
