import 'package:flutter/material.dart';

class ContainerWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            // 스타일 적용
            decoration: BoxDecoration(
              // 배경 색상 설정
              color: Colors.blueAccent,
              border: Border.all(
                // 테두리 굵기
                width: 16.0,
                // 테두리 색상
                color: Colors.pinkAccent,
              ),
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            width: 200.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}