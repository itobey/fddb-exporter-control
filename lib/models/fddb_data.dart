/// Represents and maps the data received from the backend service.
class FddbData {
  final int id;
  final String date;
  final int kcal;
  final int fat;
  final int carbs;
  final int sugar;
  final int protein;
  final int fiber;

  /// Creates a new [FddbData] instance.
  const FddbData({
    required this.id,
    required this.date,
    required this.kcal,
    required this.fat,
    required this.carbs,
    required this.sugar,
    required this.protein,
    required this.fiber,
  });

  /// Maps the data from json.
  factory FddbData.fromJson(Map<String, dynamic> json) {
    return FddbData(
      id: json['id'],
      date: json['date'],
      kcal: json['kcal'],
      fat: json['fat'],
      carbs: json['carbs'],
      sugar: json['sugar'],
      protein: json['protein'],
      fiber: json['fiber'],
    );
  }
}
