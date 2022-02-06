class Transaction {
  String title;
  double price;
  DateTime date;
  String id;
  Transaction(
      {required this.id,
      required this.date,
      required this.price,
      required this.title});
}
