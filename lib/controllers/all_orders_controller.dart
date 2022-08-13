import 'dart:convert';
import 'package:dofd_driver_panel/data/repository/all_orders_repo.dart';
import 'package:dofd_driver_panel/utils/app_constants.dart';
import 'package:get/get.dart';
import '../models/response_model.dart';

class AllOrdersController extends GetxController {
  final AllOrdersRepo allOrdersRepo;

  AllOrdersController({required this.allOrdersRepo});

  List<dynamic> _allOrdersList = [];

  List<dynamic> get allOrdersList => _allOrdersList;

  bool _isLoaded = false;
  bool _isLoading = false;

  bool get isLoaded => _isLoaded;

  bool get isLoading => _isLoading;

  Future<void> getAllOrdersList() async {
    Response response = await allOrdersRepo.getAllOrdersList();
    if (response.statusCode == 200) {
      _allOrdersList = [];
      response.body.forEach((order) {
        _allOrdersList.add(order);
      });

      List<dynamic> _reversedAllOrdersList = [];
      _reversedAllOrdersList = _allOrdersList.reversed.toList();

      List<dynamic> _paidOrdersList = [];
      _reversedAllOrdersList.forEach((order) {
        if(order["payment_status"] == "paid"){
          _paidOrdersList.add(order);
        }
      });

      _allOrdersList = _paidOrdersList;



      _isLoaded = true;
      update();
    }

  }

  Future<ResponseModel> markAsDelivered(String orderId, DateTime date) async {
    _isLoading = true;
    update();

    Response response = await allOrdersRepo.markAsDelivered(date, orderId);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body.toString());
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = false;
    update();
    return responseModel;
  }
}
