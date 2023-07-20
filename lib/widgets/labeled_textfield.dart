import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final ValueChanged onChanged;
  const LabeledTextField({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.orange.withOpacity(
                  .8,
                ),
              ),
            ),
            SizedBox(
              width: 80,
              height: 25,
              child: TextFormField(
                onChanged: (value) => onChanged(
                  value,
                ),
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
