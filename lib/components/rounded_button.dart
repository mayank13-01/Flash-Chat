import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  const RoundedButton({super.key, required this.colour, required this.title,required this.onTap});
  final Color colour;
  final String title;
  final VoidCallback  onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
