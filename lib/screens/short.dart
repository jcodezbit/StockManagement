import 'package:flutter/material.dart';

import '../model/product.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  final List<Product> items = [
    Product(
      id: 'p1',
      title: 'Pencil',
      packing: 'Box',
      price: "29.99",
      unit: 1,
      qty: 1,
      amount: "100",
      discount: "10",
      tax: "2",
      total: "29.99",
    ),
    Product(
      id: 'p2',
      title: 'Oil',
      packing: 'Tank',
      price: "29.99",
      unit: 1,
      qty: 1,
      amount: "200",
      discount: "10",
      tax: "2",
      total: "40.99",
    ),
    Product(
      id: 'p3',
      title: 'Pen',
      packing: 'Packet',
      price: "29.99",
      unit: 1,
      qty: 1,
      amount: "300",
      discount: "10",
      tax: "2",
      total: "70.99",
    ),
  ];

  List<Product> filteredItems = [];

  List<Product> selectedItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = [];
  }

  @override
  void filterList(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredItems = [];
      });
    } else {
      List<Product> searchList = items
          .where(
              (item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        filteredItems = searchList;
      });
    }
  }

  @override
  void selectItem(Product item) {
    setState(() {
      if (!selectedItems.contains(item)) {
        selectedItems.add(item);
      }
    });
  }

  void deselectItem(Product item) {
    setState(() {
      selectedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List Page'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              filterList(value);
            },
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text('No items found.'),
                  )
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredItems[index].title),
                        subtitle: Text(filteredItems[index].packing),
                        onTap: () {
                          selectItem(filteredItems[index]);
                        },
                      );
                    },
                  ),
          ),
          selectedItems.isEmpty
              ? Container()
              : Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: Chip(
                          label: Text(selectedItems[index].total),
                          onDeleted: () {
                            deselectItem(selectedItems[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
