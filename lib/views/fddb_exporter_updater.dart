import 'package:flutter/material.dart';

import '../models/fddb_data.dart';
import '../services/fddb_exporter_service.dart';
import '../widgets/fddb_data_result_set.dart';

/// Contains the entire view for the application.
class FddbBatch extends StatefulWidget {
  const FddbBatch({Key? key}) : super(key: key);

  @override
  State<FddbBatch> createState() => _FddbBatchState();
}

/// Contains the entire view for the application.
class _FddbBatchState extends State<FddbBatch> {
  /// The value of the checkbox to include today in the request to the service.
  bool _includeToday = false;
  /// The amount of days to include in the request to the service.
  final _daysInputController = TextEditingController();
  /// Necessary to close the keyboard on button press.
  late FocusNode _focusNode;
  /// The future containing the [FddbData] from the endpoint request.
  Future<List<FddbData>> _future = Future.value([]);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _refreshData() {
    setState(() {
      _future =
          exportData(_daysInputController.text, _includeToday.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FDDB Exporter Update"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 40),
              SizedBox(
                width: 50,
                child: Column(
                  children: [
                    Text("days", style: Theme.of(context).textTheme.titleSmall),
                    TextField(
                      focusNode: _focusNode,
                      maxLines: 1,
                      controller: _daysInputController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text("include today",
                      style: Theme.of(context).textTheme.titleSmall),
                  Checkbox(
                    value: _includeToday,
                    onChanged: (bool? value) {
                      setState(() {
                        _includeToday = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _focusNode.unfocus();
                  _refreshData();
                },
                child:
                    const Text("Update Data"),
              ),
              const SizedBox(width: 40),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          const SizedBox(height: 15),
          FutureBuilder<List<FddbData>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(child: ResultSet(fddbData: snapshot.data!));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}