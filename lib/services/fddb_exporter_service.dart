import 'dart:convert';

import 'package:fddb_exporter_control/config.dart';
import 'package:http/http.dart' as http;

import '../models/fddb_data.dart';

/// Calls the endpoint of the backend service to export the data.
///
/// [days] The amount of days back to export (not counting today).
/// [includeToday] 'true' if today should be exported as well.
///
/// Returns a Future containing the exported data.
Future<List<FddbData>> exportData(String days, String includeToday) async {
  final response = await http.get(Uri.parse(
      '${Config.endpoint}/batch?days=$days&includeToday=$includeToday'));

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((data) => FddbData.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load FDDB Data');
  }
}
