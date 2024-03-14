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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // column일 때 세로 기준 가운데 정렬, row일 때 가로 기준 가운데 정렬
            children: [
              TextButton(
                // 클릭 시 실행
                onPressed: () {},
                // 스타일 지정
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                // 버튼에 넣을 위젯
                child: Text('텍스트 버튼'),
            ),
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: Text('아웃라인드 버튼'),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text('엘리베이티드 버튼'),
              )

            ],
          )
        ),
      ),
    );
  }

}