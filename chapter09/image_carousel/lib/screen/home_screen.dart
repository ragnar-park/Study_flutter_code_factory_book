import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  // pageController 생성
  final PageController pageController = PageController();

  void initState() {
    super.initState(); // 부모 initState() 실행

    Timer.periodic(Duration(seconds: 3), (timer) {

      // 현재 페이지 가져오기
      int? nextPage = pageController.page?.toInt();

      if (nextPage == null) { // 페이지 값이 없을 때 예외 처리
        return;
      }

      if (nextPage == 4) { // 첫 페이지와 마지막 페이지 분기 처리
        nextPage = 0;
      } else {
        nextPage++;
      }
      pageController.animateToPage( // 페이지 변경
          nextPage, // 이동할 페이지가 정수로 입력되면 현재 페이지를 변경할 수 있음
          duration: Duration(milliseconds: 500), // 이동할 때 소요 시간
          curve: Curves.ease, // 애니메이션 작동 방식
      );


    });
  }

  @override
  Widget build(BuildContext context) {

    // 상태바 색상 변경
    // 상태바가 이미 휜색이라면 light 대신 dark를 주어 검정으로 변경
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView( // PageView 추가

        controller: pageController,
        // 샘플 리스트 생성
        // children 속성이 List<Widget>을 필요로 하기때문에, map() 함수로 생성된 Iterable에 toList()를 호출하여 List로 변환해야 함
        // BoxFit.cover는 이미지가 최대한 전체 화면을 차지하도록 늘어상
        children: [1, 2, 3, 4, 5].map((number) => Image.asset('asset/img/image_$number.jpeg',fit: BoxFit.cover,)).toList(),
      ),
    );
  }
}