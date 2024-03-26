import 'package:flutter/material.dart';

class SafeAreaWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          // 원하는 부위만 따로 적용할 수도 있음
          // true는 적용 false는 미적용
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: Container(
            color: Colors.amber,
            height: 300.0,
            width: 300.0,
          ),

        ),
      )
    );
  }

}