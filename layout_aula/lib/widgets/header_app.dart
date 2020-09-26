import 'package:flutter/material.dart';

import 'drop_list.dart';

class HeaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Salas Virtuais',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'Período',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          DropList(),
        ],
      ),
    );
  }
}