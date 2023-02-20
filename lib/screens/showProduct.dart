import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../model/product.dart';
import 'edit.dart';
import 'produtData.dart';

class ShowProduct extends StatefulWidget {
  ShowProduct({Key? key}) : super(key: key);

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  String uuid = Uuid().v4(); // Generate a random UUID

  void _generateNewUuid() {
    setState(() {
      uuid = Uuid().v4(); // Generate a new random UUID
    });
  }

  final List<Product> loadedproducts = [
    Product(
      id: 'p1',
      title: 'pencil',
      packing: 'box',
      price: "29.99",
      unit: 100,
      qty: 1,
      amount: "100",
      discount: "10",
      tax: "2",
      total: "29.99",
    ),
    Product(
      id: 'p2',
      title: 'oil',
      packing: 'tank',
      price: "29.99",
      unit: 200,
      qty: 1,
      amount: "200",
      discount: "10",
      tax: "2",
      total: "40.99",
    ),
    Product(
      id: 'p3',
      title: 'pen',
      packing: 'packet',
      price: "29.99",
      unit: 300,
      qty: 1,
      amount: "300",
      discount: "10",
      tax: "2",
      total: "70.99",
    ),
    Product(
      id: 'p1',
      title: 'pencil',
      packing: 'box',
      price: "29.99",
      unit: 100,
      qty: 1,
      amount: "100",
      discount: "10",
      tax: "2",
      total: "29.99",
    ),
    Product(
      id: 'p2',
      title: 'oil',
      packing: 'tank',
      price: "29.99",
      unit: 200,
      qty: 1,
      amount: "200",
      discount: "10",
      tax: "2",
      total: "40.99",
    ),
    Product(
      id: 'p3',
      title: 'pen',
      packing: 'packet',
      price: "29.99",
      unit: 300,
      qty: 1,
      amount: "300",
      discount: "10",
      tax: "2",
      total: "70.99",
    ),
  ];
  List<Product> filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Set the initial filteredItems list to be the same as the items list
    filteredItems = loadedproducts;
  }

  void filterList(String query) {
    List<Product> searchList = loadedproducts
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredItems = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          //color: const Color(0xffDADADA),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              height: 80,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xffDADADA),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 13.0, bottom: 8),
                            child: TextField(
                              onChanged: (value) {
                                filterList(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Search a Product",
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.08,
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, right: 8, left: 8),
                            decoration: BoxDecoration(
                                color: const Color(0xff5D62B5),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 40,
                                    //  color: Colors.red,

                                    child: const Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ))
                              ],
                            ))
                      ],
                    ),
                  ),
                  // SizedBox(width: 10,),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      openPopup(context);
                      _generateNewUuid();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          color: const Color(0xffDADADA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        height: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xff61B937),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Expanded(
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                                height: 40,
                                child: const Text(
                                  'Create',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(10)),
            // color: const Color(0xffDADADA),
            child: Column(
              children: [
                const Text(
                  "Products",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff343B3F)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 55, top: 25, left: 25),
                  child: Row(
                    children: const [
                      Text(
                        'Product',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff343B3F)),
                      ),
                      Spacer(),
                      Text(
                        'Packing',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff343B3F)),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Units',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff343B3F)),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff343B3F)),
                      ),
                      SizedBox(
                        width: 55,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Product = filteredItems[index];
                        return Container(
                          //height: 100,
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          //height: MediaQuery.of(context).size.height * 0.8,

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 35,
                                  margin:
                                      const EdgeInsets.only(left: 20, right: 1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 2, bottom: 3, left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          Product.title,
                                        ),
                                        Spacer(),
                                        Text(
                                          Product.packing,
                                        ),
                                        SizedBox(
                                          width: 75,
                                        ),
                                        Text(Product.unit.toString()),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text(
                                          Product.price,
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              // removeItem(index);
                                              editPopup(context);
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.grey,
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              removeItem(index);
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void removeItem(int index) {
    setState(() {
      loadedproducts.removeAt(index);
    });
    AlertDialog(
      title: Text('Confirm'),
      content: Text('Are you sure you want to remove this item?'),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        ElevatedButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
