import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dofd_driver_panel/pages/order/all_orders.dart';
import 'package:dofd_driver_panel/utils/colors.dart';
import '../account/account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    AllOrders(),
    //AccountPage(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
    );

    /**
     * To be uncommented if a sign up procedure is wanted
     * In that case, remember to update backend's following methods in api.php
     * so that they would require authentiacation first
     * Remember to uncomment List pages = [ AccountPage()]
     *
     * Route::get('all', 'OrderController@get_all_order_list');
     * Route::patch('mark-as-delivered', 'OrderController@markAsDelivered');
     * Route::patch('mark-as-pay-on-door', 'OrderController@markAsPayOnDoor');
     * Route::get('detail/{id}', 'OrderController@getOrderDetail');
     **/

    /*return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainColorTransparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "all orders",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label: "me",
          ),
        ],
      ),
    );*/
  }
}
