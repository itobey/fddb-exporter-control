import 'package:fddb_exporter_control/widgets/fddb_data_stats_container.dart';
import 'package:flutter/material.dart';

/// Contains the 'date' header part of each row in the result set, as it is different from the remaining data in [FddbDataStatsContainer].
class FddbDataDateContainer extends StatelessWidget {
  /// The date as a string (should be in format 'yyyy-mm-dd').
  final String date;

  const FddbDataDateContainer({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Text(date, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
