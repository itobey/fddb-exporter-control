import 'package:flutter/material.dart';

/// Contains a single stat from a result set with the matching label, e.g. 'kcal' and '2321'.
/// A row of the [ResultSet] will contain multiple of these containers to display all the data of each day.
class FddbDataStatsContainer extends StatelessWidget {
  /// A single stat number, e.g. '47'
  final int stat;
  /// The label of the stat, e.g. 'sugar'.
  final String label;

  const FddbDataStatsContainer({
    Key? key,
    required this.stat,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor)),
              padding: const EdgeInsets.all(5),
              child:
                  Text(label, style: Theme.of(context).textTheme.bodyMedium)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              color: Theme.of(context).primaryColor,
            ),
            padding: const EdgeInsets.all(5),
            child: Text(
              stat.toString(),
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
