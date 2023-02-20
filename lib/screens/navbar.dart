import 'package:flutter/material.dart';
import 'package:inventorysystem/screens/dashboard.dart';
import 'package:inventorysystem/screens/login.dart';

import 'productDetails.dart';
import 'sales.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    Dashboard(),
    ProductDetails(),
    Sales(),
    Dashboard(),
    Dashboard(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            //padding: EdgeInsets.only(left: 8,right: 8),
            width: 80,
            child: NavigationRail(
              backgroundColor: Color(0xffDADADA),

              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },

              selectedIndex: _selectedIndex,

              destinations: const [
                NavigationRailDestination(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/line.png',
                    ),
                  ),
                  label: Text(
                    '',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                NavigationRailDestination(
                  icon: ImageIcon(
                    AssetImage('assets/images/box.png'),
                  ),
                  label: Text(
                    '',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                NavigationRailDestination(
                  icon: ImageIcon(
                    AssetImage('assets/images/open.png'),
                  ),
                  label: Text(
                    '',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                NavigationRailDestination(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/bag.png',
                    ),
                  ),
                  label: Text(
                    '',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                NavigationRailDestination(
                  icon: ImageIcon(
                    AssetImage('assets/images/p1.png'),
                  ),
                  label: Text(
                    '',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ],

              labelType: NavigationRailLabelType.all,

              selectedLabelTextStyle: const TextStyle(
                color: Colors.white,
              ),

              unselectedLabelTextStyle: const TextStyle(),

              // Called when one tab is selected
            ),
          ),
          Expanded(child: _screens[_selectedIndex])
        ],
      ),
    );
  }
}
