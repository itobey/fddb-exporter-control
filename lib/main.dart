import 'dart:io';

import 'package:fddb_exporter_control/themes/theme.dart';
import 'package:fddb_exporter_control/views/fddb_exporter_updater.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = DevHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fddb Exporter Updater',
      theme: themeData(),
      home: const FddbBatch(),
    );
  }
}

/// Disables certificate warnings. Necessary as my own cert installed in Android does not seem to work.
/// Needs to be set in main().
class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
