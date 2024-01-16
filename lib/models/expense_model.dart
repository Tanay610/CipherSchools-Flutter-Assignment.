
class ExpenseModel {
  final int id;
  final String description;
  final double amount;
  final String category;
  final String wallet;
  final DateTime time;

  ExpenseModel( {
    required this.id,
    required this.description,
    required this.amount,
    required this.category,
    required this.wallet,
    required this.time,
  });
}


class Income {
  final int id;
  final String description;
  final double amount;
  final String category;
  final String wallet;
  final DateTime time;
  Income({
    required this.id,
    required this.description,
    required this.amount,
    required this.category,
    required this.wallet,
    required this.time,
  });
}