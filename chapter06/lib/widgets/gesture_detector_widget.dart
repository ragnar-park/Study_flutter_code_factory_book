import 'package:flutter/material.dart';

class GestureDetectorWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            // 한 번 탭 했을때 실행 함
            onTap: () {
              print('on tab');
            },
            // 두 번 탭 했을때 실행 함
            onDoubleTap: () {
              print('on double tab');
            },
            // 길게 눌렀을 때 실행
            onLongPress: () {
              print('on long press');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
  
}