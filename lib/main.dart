import 'package:flutter/material.dart';
import 'package:recibe_calculator/ListBuilder.dart';
/// Flutter code sample for [ListTile] selection in a [ListView] or [GridView].

void main() => runApp(const ListViewExampleApp());

class ListViewExampleApp extends StatelessWidget {
  const ListViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Recipe Calculator'
              ),
            ],
          ),
        ),
        body:ListBuilder(),
      ),
    );
  }
}
