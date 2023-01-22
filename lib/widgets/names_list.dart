import 'package:flutter/material.dart';

class NameList extends StatefulWidget {
  @override
  State<NameList> createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'put name here',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'put name here',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'put name here',
            ),
          ),
        ],
      ),
    );
  }
}
