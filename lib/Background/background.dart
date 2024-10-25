import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  // ignore: use_super_parameters
  const Background({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2D045D),
            Color(0xFF161616),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 25.0,
            spreadRadius: 5.0,
            offset: Offset(
                10, 10), // Shadow effect similar to the border in the image
          ),
        ],
      ),
      child: child,
    );
  }
}