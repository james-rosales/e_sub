import 'package:e_sub/pages/calculate/calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculateBloc>(
      create: (context) => CalculateBloc(CalculateState()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              children: [
                CalculateForm(),
                CalculateResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
