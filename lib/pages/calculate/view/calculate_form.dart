import 'package:e_sub/pages/calculate/calculate.dart';
import 'package:e_sub/widgets/labeled_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateForm extends StatelessWidget {
  const CalculateForm({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<CalculateBloc>();
    return BlocBuilder<CalculateBloc, CalculateState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            // const Text(
            //   'PANASONC AIRCON SUB METER',
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: 50),
            LabeledTextField(
              label: 'Enter Previous Reading (kWh)',
              onChanged: (value) => bloc.add(
                PreviousReadingValueChanged(value),
              ),
            ),
            LabeledTextField(
              label: 'Enter Current Reading (kWh)',
              onChanged: (value) => bloc.add(
                CurrentReadingValueChanged(value),
              ),
            ),
            LabeledTextField(
              label: 'Enter VECO Used (kWh)',
              onChanged: (value) => bloc.add(
                VecoUsedKwhValueChanged(value),
              ),
            ),
            LabeledTextField(
              label: 'Enter VECO Total Bill (₱)',
              onChanged: (value) => bloc.add(
                VecoTotalBillValueChanged(value),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
