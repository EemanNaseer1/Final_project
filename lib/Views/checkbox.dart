import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onChanged;

  CheckBox({required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: isChecked
              ? Color.fromRGBO(36, 28, 100, 1.0)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color.fromRGBO(36, 28, 100, 1.0),
            width: 2,
          ),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              )
            : null,
      ),
    );
  }
}
