import 'package:flutter/material.dart';

class StandardElevatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  const StandardElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.color});

  @override
  State<StandardElevatedButton> createState() => _StandardElevatedButtonState();
}

class _StandardElevatedButtonState extends State<StandardElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        elevation: 10,
        padding: const EdgeInsets.all(15),
      ),
      child: widget.child,
    );
  }
}
