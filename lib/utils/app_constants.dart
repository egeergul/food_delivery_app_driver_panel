class AppConstants {
  static const String APP_NAME = "DOFD Driver";
  static const int APP_VERSION = 1;


  static const String BASE_URL = "http://127.0.0.1:8000";
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";
  static const String UPLOAD_URL = "/uploads/";

  // orders
  static const String ALL_ORDERS_URI = "/api/v1/customer/order/all";
  static const String ALL_ORDERS_MARK_AS_DELIVERED = "/api/v1/customer/order/mark-as-delivered";

  // order details
  static const String ORDER_DETAIL = "/api/v1/customer/order/detail";
  //product detail
  static const String PRODUCT_DETAIL = "/api/v1/products/find-product";

  // user and auth endpoints
  static const String REGISTERATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI="/api/v1/customer/info";

  //new
  static const String USER_ADDRESS = "user_address";
  static const String ADD_USER_ADDRESS = "/api/v1/customer/address/add";
  static const String ADDRESS_LIST_URI = "/api/v1/customer/address/list";

  static const String GEOCODE_URI = '/api/v1/config/geocode-api';
  static const String ZONE_URI = '/api/v1/config/get-zone-id';

  static const String TOKEN = "";
  static const String PHONE = "";
  static const String PASSWORD = "";

  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";

}
 