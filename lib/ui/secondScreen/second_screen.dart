
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text("Click Me !")),
      appBar: AppBar(
        title: SelectableText("Second Screen"),
      ),
    );
  }
}
