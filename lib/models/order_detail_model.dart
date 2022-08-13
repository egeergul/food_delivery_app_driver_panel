import 'address_model.dart';

class OrderDetail {
  int? _totalSize;
  int? _typeId;
  int? _offset;

  late List<OrderDetailModel> _orderDetails;

  List<OrderDetailModel> get orderDetails => _orderDetails; // getter

  OrderDetail(
      {required totalSize, required typeId, required offset, required orders}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._orderDetails = orders;
  }

  OrderDetail.fromJson(List<dynamic> json) {
    if (json != null) {
      _orderDetails = <OrderDetailModel>[];
      json.forEach((v) {
        _orderDetails.add(new OrderDetailModel.fromJson(v));
      });
    }
  }
}

class OrderDetailModel {
  int? id;
  int? orderId;
  int? foodId;
  int? price;
  String? foodDetails;
  int? quantity;
  int? taxAmount;
  String? createdAt;
  String? updatedAt;
  int? test;

  OrderDetailModel(
      {this.id,
      required this.orderId,
      required this.foodId,
      required this.price,
      required this.foodDetails,
      required this.quantity,
      this.taxAmount,
      this.createdAt,
      this.updatedAt,
      this.test}) {
    this.id = id;
    this.orderId = orderId;
    this.foodId = foodId;
    this.price = price;
    this.foodDetails = foodDetails;
    this.quantity = quantity;
    this.taxAmount = taxAmount;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    foodId = json['food_id'];
    price = json['price'];
    foodDetails = json['food_details'];
    quantity = json['quantity'];
    taxAmount = json['tax_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    test = json['test'];
  }

  //TODO
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
    };
  }

  @override
  String toString() {
    String res = "";
    res = res + " id: " + this.id.toString();
    res = res + " orderId: " + this.orderId.toString();
    res = res + " foodId: " + this.foodId.toString();
    res = res + " price: " + this.price.toString();
    res = res + " foodDetails: " + this.foodDetails.toString();

    return res;
  }
}
