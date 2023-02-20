import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/product.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;

import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

import 'charts.dart';
import 'charts.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final List<Product> loadedproducts = [
    Product(
      id: 'p1',
      title: 'pencil',
      packing: 'box',
      price: "29.99",
      unit: 333,
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
      unit: 555,
      qty: 1,
      amount: "200",
      discount: "10",
      tax: "2",
      total: "40.99",
    ),
    Product(
      id: 'p3',
      title: 'book',
      packing: 'packet',
      price: "29.99",
      unit: 444,
      qty: 1,
      amount: "300",
      discount: "10",
      tax: "2",
      total: "70.99",
    ),
    Product(
      id: 'p4',
      title: 'card',
      packing: 'box',
      price: "29.99",
      unit: 777,
      qty: 1,
      amount: "100",
      discount: "10",
      tax: "2",
      total: "29.99",
    ),
    Product(
      id: 'p5',
      title: 'ink',
      packing: 'tank',
      price: "29.99",
      unit: 888,
      qty: 1,
      amount: "200",
      discount: "10",
      tax: "2",
      total: "40.99",
    ),
    Product(
      id: 'p6',
      title: 'yes',
      packing: 'packet',
      price: "29.99",
      unit: 999,
      qty: 1,
      amount: "300",
      discount: "10",
      tax: "2",
      total: "70.99",
    ),
  ];
  TextEditingController searchController = TextEditingController();
  List<Product> filteredItems = [];
  String _filePath = '';

  List<Product> selectedItems = [];

  Future<void> _saveFile(String content) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    await file.writeAsString(content);
    setState(() {
      _filePath = file.path;
    });
  }

  void _displayPdf() {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
              child: pw.Column(children: [
            pw.Text('text'),
          ]));
        },
      ),
    );

    /// open Preview Screen
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(doc: doc),
        ));
  }

  // Future<void> _printFile() async {
  //   await Printing.layoutPdf(
  //       onLayout: (PdfPageFormat format) async => await File(_filePath).readAsBytes());
  // }
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
      List<Product> searchList = loadedproducts
          .where((item) =>
              item.unit == double.tryParse(query) ||
              item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        filteredItems = searchList;
      });
    }
  }

  void toggleSelectedItem(Product) {
    setState(() {
      if (selectedItems.contains(Product)) {
        selectedItems.remove(Product);
      } else {
        selectedItems.add(Product);
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void removeSelectedItem(Product) {
    setState(() {
      selectedItems.remove(Product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: const Color(0xffDADADA),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 13.0, bottom: 8),
                                        child: TextField(
                                          controller: searchController,
                                          onChanged: (value) {
                                            filterList(value);
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Search a Product",
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(width: 20,),
                        ],
                      )),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xffDADADA),
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
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
                            padding: const EdgeInsets.only(
                                right: 50, top: 10, left: 25, bottom: 10),
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
                                  'Qty',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff343B3F)),
                                ),
                                SizedBox(
                                  width: 55,
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
                                Text(
                                  'Discount',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff343B3F)),
                                ),
                                SizedBox(
                                  width: 55,
                                ),
                                Text(
                                  'Tax',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff343B3F)),
                                ),
                                SizedBox(
                                  width: 65,
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff343B3F)),
                                ),
                              ],
                            ),
                          ),
                          selectedItems.isEmpty
                              ? Container()
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  child: ListView.builder(
                                    itemCount: selectedItems.length,
                                    itemBuilder: (context, index) {
                                      final selectedItem = selectedItems[index];
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 12, right: 12, bottom: 10),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: const Color(0xffDADADA),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 55),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.clear_rounded),
                                              onPressed: () =>
                                                  removeSelectedItem(
                                                      selectedItem),
                                            ),
                                            Text(selectedItem.title),
                                            Spacer(),
                                            Text(selectedItem.packing),
                                            SizedBox(
                                              width: 65,
                                            ),
                                            Row(
                                              children: [
                                                Text(selectedItem.qty
                                                    .toString()),
                                                Column(
                                                  children: [
                                                    CupertinoButton(
                                                      minSize:
                                                          double.minPositive,
                                                      padding: EdgeInsets.zero,
                                                      child: Icon(
                                                          Icons.arrow_drop_up,
                                                          color: Colors.black,
                                                          size: 20),
                                                      onPressed: () {
                                                        setState(() =>
                                                            (selectedItem
                                                                .qty++));
                                                      },
                                                    ),
                                                    CupertinoButton(
                                                      minSize:
                                                          double.minPositive,
                                                      padding: EdgeInsets.zero,
                                                      child: Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.black,
                                                          size: 20),
                                                      onPressed: () {
                                                        setState(() {
                                                          if (selectedItem.qty >
                                                              1) {
                                                            selectedItem.qty--;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 55,
                                            ),
                                            Text(selectedItem.price),
                                            SizedBox(
                                              width: 85,
                                            ),
                                            Text(selectedItem.discount),
                                            SizedBox(
                                              width: 90,
                                            ),
                                            Text(selectedItem.tax),
                                            SizedBox(
                                              width: 75,
                                            ),
                                            Text(selectedItem.total),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(),
                      Spacer(),
                      Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: 30,
                                        width: 120,
                                        padding: EdgeInsets.all(3),
                                        color: const Color(0xffDADADA),
                                        child: Text('Rounded Amount :')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 80,
                                        child: Text('0.00')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 100,
                                        color: const Color(0xffDADADA),
                                        child: Text('Sub Total :')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 80,
                                        child: Text('\$ 6000')),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 120,
                                        color: const Color(0xffDADADA),
                                        child: Text('Discount :')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 80,
                                        child: Text('0.00')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 100,
                                        color: const Color(0xffDADADA),
                                        child: Text('Texable amount :')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 80,
                                        child: Text('\$ 6000')),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 120,
                                        color: const Color(0xffDADADA),
                                        child: Text('Delivery Charge :')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 80,
                                        child: Text('0.00')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 100,
                                        color: const Color(0xffDADADA),
                                        child: Text('Tax :')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 80,
                                        child: Text('0.00')),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 120,
                                        color: const Color(0xffDADADA),
                                        child: Text('Add Others : ')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 80,
                                        child: Text('0.00')),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 100,
                                        color: const Color(0xffDADADA),
                                        child: Text(
                                          'Net Amount : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        width: 80,
                                        height: 30,
                                        child: Text(
                                          '\$ 600000',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: const Color(0xffDADADA),
                                borderRadius: BorderRadius.circular(6)),
                            child: Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: _displayPdf,
                                  child: Text(
                                    "Save & Print",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              if (filteredItems.isEmpty)
                Center(
                  child: Text(''),
                )
              else
                Container(
                  margin: EdgeInsets.only(top: 66, right: 10, left: 10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Product = filteredItems[index];
                        return Container(
                          //height: 100,
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      toggleSelectedItem(Product);
                                      searchController.clear();
                                      filteredItems.clear();
                                    });
                                  },
                                  child: Container(
                                    height: 45,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 40),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10,
                                          top: 2,
                                          bottom: 3,
                                          left: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            Product.title,
                                          ),
                                        ],
                                      ),
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
          )),
    );
  }

  // Define a function to show the alert dialog
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("This is an alert dialog."),
          actions: [
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                // Do something when OK button is pressed
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class PreviewScreen extends StatelessWidget {
  final pw.Document doc;

  const PreviewScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Bill template"),
      content: SizedBox(
        width: 400,
        height: 500,
        child: PdfPreview(
          build: (format) => doc.save(),
          // allowSharing: true,
          // allowPrinting: true,
          // initialPageFormat: PdfPageFormat.a4,
          // pdfFileName: "mydoc.pdf",
        ),
      ),
      actions: [
        ElevatedButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
