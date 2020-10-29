import 'package:flutter/material.dart';
import 'package:interface_nubank/themes/colors.dart';
import 'package:interface_nubank/widgets/account_info.dart';
import 'package:interface_nubank/widgets/bottom_appbar.dart';
import 'package:interface_nubank/widgets/card_info.dart';
import 'package:interface_nubank/widgets/person_identification.dart';
import 'package:interface_nubank/widgets/tab_options.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NPrimaryCollor,
      appBar: AppBar(
        title: PersonIdentification(),
        bottom: NBottomAppBar(
          isExpanded: _isExpanded,
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: AccountInfo(isExpanded: _isExpanded),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: <Widget>[
                  CardInfo(),
                  SizedBox(height: 15),
                  CardInfo(),
                  SizedBox(height: 15),
                  CardInfo(),
                ],
              ),
            ),
            SizedBox(height: 20),
            TabOptions()
          ],
        ),
      ),
    );
  }
}
