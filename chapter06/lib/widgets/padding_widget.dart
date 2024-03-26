import 'package:flutter/material.dart';

class PaddingWidgetExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            child: Padding(

              // 상하좌우 모두 적용
              padding: EdgeInsets.all(
                16.0
              ),
              child: Container(
                color: Colors.pinkAccent,
                width: 50.0,
                height: 50.0,
              ),

            ),
          ),
        ),
      ),

    );
  }

}