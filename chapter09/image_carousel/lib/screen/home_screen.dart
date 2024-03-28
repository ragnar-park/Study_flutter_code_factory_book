import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {

    // 상태바 색상 변경
    // 상태바가 이미 휜색이라면 light 대신 dark를 주어 검정으로 변경
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView( // PageView 추가
        // 샘플 리스트 생성
        // children 속성이 List<Widget>을 필요로 하기때문에, map() 함수로 생성된 Iterable에 toList()를 호출하여 List로 변환해야 함
        // BoxFit.cover는 이미지가 최대한 전체 화면을 차지하도록 늘어상
        children: [1, 2, 3, 4, 5].map((number) => Image.asset('asset/img/image_$number.jpeg',fit: BoxFit.cover,)).toList(),
      ),
    );
  }
}