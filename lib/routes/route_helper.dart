import 'package:dofd_driver_panel/pages/auth/sing_in_page.dart';
import 'package:dofd_driver_panel/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../pages/home/home_page.dart';
import '../pages/order/order_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashPage = "/splash-page";
  static const String orderPage = "/order-page";
  static const String signIn = "/sign-in";

  static String getInitial() => "$initial";

  static String getSplashPage() => "$splashPage";

  static String getSignInPage() => "$signIn";

  static String getOrder(int pageId, String page) =>
      "$orderPage?pageId=$pageId&page=$page";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
        name: initial,
        page: () {
          return HomePage();
        },
        transition: Transition.fade),
    GetPage(
        name: signIn, page: () => SignInPage(), transition: Transition.fade),
    GetPage(
      name: orderPage,
      page: () {
        var pageId = Get.parameters["pageId"];
        var page = Get.parameters["page"];
        return OrderDetail(pageId: int.parse(pageId!), page: page!);
      },
    ),
  ];
}

class Trasition {}
