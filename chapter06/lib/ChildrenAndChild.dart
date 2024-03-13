import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          // 하나의 위젯만 가운데 정렬 가능
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            // 여러 위젯을 Column 위젯에 입력 가능
            children: [
              Text('Ragnar!'),
              Text('Park!'),
            ],
          ),
        ),
      ),
    )
  );
}
