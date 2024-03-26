import 'package:flutter/material.dart';

class FloatingActionButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          // 클릭했을 때 실행 함
          onPressed: () {},
          child: Text('클릭'),
        ),
        body: Container(),
      ),
    );
  }

}