import 'package:flutter/material.dart';

class DropList extends StatefulWidget {
  @override
  _DropListState createState() => _DropListState();
}

class _DropListState extends State<DropList> {
  String dropdownValue = '2020/02';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black54),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 15),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 35,
          elevation: 16,
          isExpanded: true,
          style: TextStyle(color: Colors.black54),
          underline: Container(
            color: Colors.transparent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['2020/02', '2020/01', '2019/02', '2019/01']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
