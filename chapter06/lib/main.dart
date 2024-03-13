import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            // 작성하고 싶은 글
            'Ragnar',
            // 글자에 스타일 적용
            style: TextStyle(
              // 글자 크기
              fontSize: 16.0,
              // 글자 굵기
              fontWeight: FontWeight.w700,
              // 글자 색상
              color: Colors.blue,
            ),
          ),// 코드 작성,
        ),
      ),
    );
  }

}