import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dofd_driver_panel/controllers/all_orders_controller.dart';
import 'package:dofd_driver_panel/controllers/order_detail_controller.dart';
import 'package:dofd_driver_panel/routes/route_helper.dart';
import 'package:dofd_driver_panel/utils/colors.dart';
import 'package:dofd_driver_panel/utils/dimensions.dart';
import 'package:dofd_driver_panel/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class OrderDetail extends StatefulWidget {
  final int pageId;
  final String page;

  const OrderDetail({
    Key? key,
    required this.pageId,
    required this.page,
  }) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState(pageId, page);
}

class _OrderDetailState extends State<OrderDetail> {
  final int pageId;
  final String page;

  _OrderDetailState(
    this.pageId,
    this.page,
  );

  @override
  Widget build(BuildContext context) {
    var product = Get.find<AllOrdersController>().allOrdersList[pageId];
    void _markAsDelivered(AllOrdersController ordersController) {
      ordersController
          .markAsDelivered(product['id'].toString(), DateTime.now())
          .then((status) {
        if (status.isSuccess) {
          Get.toNamed(RouteHelper.getInitial());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }

    return Scaffold(
      body: GetBuilder<OrderDetailController>(builder: (orderDetailController) {
        return orderDetailController.isDetailsLoaded
            ? Container(
                child:
                    GetBuilder<AllOrdersController>(builder: (orderController) {
                  return !orderController.isLoading
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              // header
                              Container(
                                height: Dimensions.height20 * 5,
                                color: AppColors.mainColor,
                                width: double.maxFinite,
                                padding: EdgeInsets.only(
                                    top: Dimensions.height15 * 3),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width15,
                                      right: Dimensions.width15,
                                      bottom: Dimensions.height15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                RouteHelper.getInitial());
                                          },
                                          child: AppIcon(icon: Icons.clear)),
                                      BigText(
                                        size: Dimensions.font26,
                                        text: product['delivered'] == null
                                            ? "Not Delivered"
                                            : "Delivered",
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //body
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.height20),
                                child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          size: Dimensions.font16 * 2,
                                          text: "Payment Method",
                                          color: AppColors.mainColor,
                                        ),
                                        BigText(
                                          text: product["payment_method"] == "door"? "Will be paid at door" : "Paid with paypal",
                                        ),
                                        SizedBox(height: Dimensions.height15),


                                        BigText(
                                          size: Dimensions.font16 * 2,
                                          text: "Contact Details",
                                          color: AppColors.mainColor,
                                        ),
                                        SizedBox(height: Dimensions.height15),

                                        BigText(
                                            text: product['delivery_address'][
                                                        'contact_person_name'] ==
                                                    null
                                                ? "Name unknown"
                                                : "NAME: " +
                                                    product['delivery_address'][
                                                            'contact_person_name']
                                                        .toString()),
                                        SizedBox(height: Dimensions.height10),
                                        BigText(
                                          text: product['delivery_address'][
                                                      'contact_person_number'] ==
                                                  null
                                              ? "Phone unknown"
                                              : "PHONE NO: " +
                                                  product['delivery_address'][
                                                          'contact_person_number']
                                                      .toString(),
                                        ),
                                        SizedBox(height: Dimensions.height10),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: BigText(
                                            text: "ADDRESS: " +
                                                product['delivery_address']
                                                        ['address']
                                                    .toString(),
                                          ),
                                        ),

                                        SizedBox(height: Dimensions.height30),

                                        BigText(
                                          size: Dimensions.font16 * 2,
                                          text: "Order Details",
                                          color: AppColors.mainColor,
                                        ),
                                        SizedBox(height: Dimensions.height15),

                                        BigText(
                                          text: "DATE: " +
                                              formatDate(product['created_at']
                                                  .toString()),
                                        ),
                                        SizedBox(height: Dimensions.height10),
                                        BigText(
                                            text: "TOTAL AMOUNT: \$" +
                                                product['order_amount']
                                                    .toString()),
                                        SizedBox(height: Dimensions.height10),

                                        // Order Details
                                        Container(
                                            child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: orderDetailController
                                                    .orderDetailsList.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: Dimensions
                                                              .width10,
                                                          right: Dimensions
                                                              .width10,
                                                          bottom: Dimensions
                                                                  .width10 /
                                                              2),
                                                      child: Row(
                                                        children: [
                                                          // text
                                                          Expanded(
                                                            child: Container(
                                                                height: Dimensions
                                                                    .listViewTextContSize,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.5),
                                                                      spreadRadius:
                                                                          2,
                                                                      blurRadius:
                                                                          5,
                                                                      offset: Offset(
                                                                          0,
                                                                          7), // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(
                                                                        Dimensions
                                                                            .radius20),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: Dimensions
                                                                          .width10,
                                                                      right: Dimensions
                                                                          .width10),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      BigText(
                                                                        text: "PRODUCT: " +
                                                                            jsonDecode(orderDetailController.orderDetailsList[index].foodDetails!.toString())['name'],
                                                                        size: Dimensions
                                                                            .height15,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            Dimensions.height10,
                                                                      ),
                                                                      SmallText(
                                                                        text: "Amount: " +
                                                                            orderDetailController.orderDetailsList[index].quantity!.toString(),
                                                                      ),
                                                                      SmallText(
                                                                          text: "Cost: \$" +
                                                                              orderDetailController.orderDetailsList[index].price!.toString() +
                                                                              " X " +
                                                                              orderDetailController.orderDetailsList[index].quantity!.toString() +
                                                                              " = \$" +
                                                                              (orderDetailController.orderDetailsList[index].price! * orderDetailController.orderDetailsList[index].quantity!).toString()),
                                                                      SizedBox(
                                                                        height:
                                                                            Dimensions.height10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })),

                                        GestureDetector(
                                          onTap: () {
                                            product['delivered'] == null
                                                ? _markAsDelivered(
                                                    orderController)
                                                : showCustomSnackBar(
                                                    "This order is already delivered!");
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height20,
                                                bottom: Dimensions.height20,
                                                right: Dimensions.width20,
                                                left: Dimensions.width20),
                                            child: Center(
                                              child: BigText(
                                                text:
                                                    product['delivered'] == null
                                                        ? "Mark as delivered"
                                                        : "Already delivered",
                                                color: Colors.white,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : CustomLoader();
                }),
              )
            : CustomLoader();
      }),
    );
  }

  String formatDate(String date) {
    String formattedDate = "";
    if (date != null) {
      formattedDate =
          DateFormat('kk:mm - dd/MM/yyyy').format(DateTime.parse(date));
    }
    return formattedDate;
  }
}
