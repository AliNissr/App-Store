import 'package:flutter/material.dart';

class BuildTextFilde extends StatelessWidget {
  BuildTextFilde(
      {super.key,
       this.onChanged,
       this.lablehiting, this.numbers});

  Function(String)? onChanged;
  String? lablehiting;
  TextInputType? numbers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: numbers,
        onChanged: onChanged!,
        decoration: InputDecoration(
          hintText: lablehiting,
          // label: Text(lablehiting!,
          //     style: const TextStyle(color: Colors.black)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
