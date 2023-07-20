import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const RoundedButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.orange.withOpacity(
            .8,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 12),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
