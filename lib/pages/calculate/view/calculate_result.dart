import 'package:e_sub/pages/calculate/calculate.dart';
import 'package:e_sub/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CalculateResult extends StatelessWidget {
  const CalculateResult({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<CalculateBloc>();
    var now = DateTime.now();
    var formatter = DateFormat.MMMM('en');
    String formattedMonth = formatter.format(now);
    return BlocBuilder<CalculateBloc, CalculateState>(
      builder: (context, state) {
        var billMonth = state.billMonth;
        return Column(
          children: [
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
                    style: const TextStyle(fontSize: 12),
                  ),
                  Builder(builder: (context) {
                    var f = NumberFormat("###,###.##", "en_US");
                    return Text(
                      '₱${f.format(double.parse(billMonth.toString()))}',
                      style: TextStyle(
                          color: Colors.orange.withOpacity(.8),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    );
                  })
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedButton(
              label: 'Calculate',
              onPressed: () => bloc.add(OnCalculatePressed()),
            ),
          ],
        );
      },
    );
  }
}
