import 'package:e_sub/widgets/labeled_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
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
    var now = DateTime.now();
    var formatter = DateFormat.MMMM('en');
    String formattedMonth = formatter.format(now);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'PANASONC AIRCON SUB METER',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              LabeledTextField(
                label: 'Enter Previous Reading (kWh)',
                controller: controllerPrevious,
              ),
              SizedBox(
                height: 20,
              ),
              LabeledTextField(
                label: 'Enter Current Reading (kWh)',
                controller: controllerCurrent,
              ),
              SizedBox(
                height: 20,
              ),
              LabeledTextField(
                label: 'Enter VECO Used (kWh)',
                controller: controllertotalKWH,
              ),
              SizedBox(
                height: 20,
              ),
              LabeledTextField(
                label: 'Enter VECO Total Bill (₱)',
                controller: controllertotalBill,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total bill for the mounth of $formattedMonth is ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Builder(builder: (context) {
                      var f = NumberFormat("###,###.0#", "en_US");
                      return Text(
                        '₱${f.format(double.parse(result.toString()))}',
                        style: TextStyle(
                            color: Colors.orange.withOpacity(.8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    })
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.orange.withOpacity(
                        .8,
                      ),
                    ),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 12))),
                onPressed: () {
                  setState(() {
                    var submeterUsedKWH;
                    var pesosPerKWH;
                    String previousReading = controllerPrevious.text;
                    String currentReading = controllerCurrent.text;
                    String totalVECOkwh = controllertotalKWH.text;
                    String totalVECObill = controllertotalBill.text;

                    submeterUsedKWH = double.parse(currentReading) -
                        double.parse(previousReading);
                    pesosPerKWH = double.parse(totalVECObill) /
                        double.parse(totalVECOkwh);
                    result = submeterUsedKWH * pesosPerKWH;
                  });
                },
                child: Text('Calculate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
