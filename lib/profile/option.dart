import 'dart:io';

import 'package:flutter/material.dart';

class options extends StatelessWidget {
  final String title;
  final IconData icon;
  Colors? color;
  File? selectedimage;
  VoidCallback? onpressed;
  options(
      {required this.onpressed,
      this.color,
      this.selectedimage,
      required this.title,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        color: selectedimage == null ? Colors.grey : Colors.red,
        onPressed: onpressed,
        icon: Icon(
          icon,
        ),
      ),
      Text(title)
    ]);
  }
}
