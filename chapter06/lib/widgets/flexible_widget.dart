import 'package:flutter/material.dart';

class FlexibleWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Flexible(
                // flex는 남은 공간을 차지할 비율을 의미
                // fkex값을 제공하지 않으면 기본값은 1임
                // flex: 1,
                flex: 3,

                // 파란 컨테이너
                child: Container(
                  color: Colors.blue
                )
              ),
              Flexible(
                flex: 1,

                // 빨간 컨테이너
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ),
        )
      )
    );
  }

}