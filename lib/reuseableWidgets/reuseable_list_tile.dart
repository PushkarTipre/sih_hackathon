import 'package:flutter/material.dart';

class reuseableListTile extends StatelessWidget {
  reuseableListTile({super.key, required this.textTile});
  String textTile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: ListTile(
        title: Text(
          textTile,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
