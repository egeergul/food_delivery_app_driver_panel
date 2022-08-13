import 'package:dofd_driver_panel/data/api/api_client.dart';
import 'package:dofd_driver_panel/utils/app_constants.dart';
import 'package:get/get.dart';

class OrderDetailRepo extends GetxService {
  final ApiClient apiClient ;

  OrderDetailRepo({required this.apiClient });


  Future<Response> getOrderDetail( int orderId) async {
    Response r =  await  apiClient.getData('${AppConstants.ORDER_DETAIL}/${orderId}' );
    return r;
  }

}