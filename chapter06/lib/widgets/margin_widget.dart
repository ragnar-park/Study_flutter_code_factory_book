// 마진 위젯은 따로 없지만 Container 위젯에 추가할 수 있음
import 'package:flutter/material.dart';

class MarginWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // 최상위 검정 컨테이너, margin 적용 대상
          child: Container(
            color: Colors.black,
            
            child: Container(
              color: Colors.blue,
              
              // 마진 적용 위치
              margin: EdgeInsets.all(16.0),
              
              // 패딩 적용
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}