import 'package:flutter/material.dart';

import 'body.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Outline gradient buttons demo'),
        ),
        backgroundColor: Colors.white,
        body: const Body(),
      ),
    );
  }
}
