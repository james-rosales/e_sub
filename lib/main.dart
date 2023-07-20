import 'package:e_sub/pages/calculate/view/calculate_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double result = 0;
  final TextEditingController controllerPrevious = TextEditingController();
  final TextEditingController controllerCurrent = TextEditingController();
  final TextEditingController controllertotalKWH = TextEditingController();
  final TextEditingController controllertotalBill = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Sub App',
      theme: ThemeData.dark(),
      home: CalculatePage(),
    );
  }
}
