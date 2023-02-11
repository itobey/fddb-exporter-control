import 'package:flutter/material.dart';

import '../models/fddb_data.dart';
import 'fddb_data_date_container.dart';
import 'fddb_data_stats_container.dart';

/// Contains and displays the entire result after a request to the backend service was made.
/// A [ListView] contains a [Row] for each entry and each entry consists of one [FddbDataDateContainer] and multiple [FddbDataStatsContainer].
class ResultSet extends StatelessWidget {
  /// The list of [FddbData] retrieved from the backend service.
  final List<FddbData> fddbData;

  const ResultSet({super.key, required this.fddbData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: fddbData.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 10),
              FddbDataDateContainer(date: fddbData[index].date),
              SizedBox(
                height: 40,
                child: VerticalDivider(
                    color: Theme.of(context).primaryColor, thickness: 2),
              ),
              FddbDataStatsContainer(
                  stat: fddbData[index].kcal, label: "Kcal"),
              FddbDataStatsContainer(
                  stat: fddbData[index].fat, label: "Fat"),
              FddbDataStatsContainer(
                  stat: fddbData[index].protein, label: "Protein"),
              FddbDataStatsContainer(
                  stat: fddbData[index].carbs, label: "Carbs"),
              FddbDataStatsContainer(
                  stat: fddbData[index].sugar, label: "Sugar"),
              FddbDataStatsContainer(
                  stat: fddbData[index].fiber, label: "Fiber"),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
