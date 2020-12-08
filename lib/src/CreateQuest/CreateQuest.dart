import 'package:flutter/material.dart';

class CreateWidget extends StatefulWidget {
  @override
  _CreateWidgetState createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Quest"),),
    );
  }
}