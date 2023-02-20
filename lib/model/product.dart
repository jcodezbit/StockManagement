class Product {
  final String id;
  final String title;
  final String packing;
  final String price;
   int unit;
  int qty;
  final String amount;
  final String discount;
  final String tax;
  final String total;

  Product({
    required this.id,
    required this.title,
    required this.packing,
    required this.price,
    required this.unit,
    required this.qty,
    required this.amount,
    required this.discount,
    required this.tax,
    required this.total,
  });
}
