import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

// TickerProviderStateMixin 사용
class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  // 사용할 탭 컨트롤러 선언
  TabController? controller;

  @override
  void initState() {
    super.initState();

    // 컨트롤러 초기화
    controller = TabController(length: 2, vsync: this);

    // 컨트롤러 속성이 변경될 때마다 실행할 함수 등록
    controller!.addListener(tabListener);
  }

  tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    // 리스너에 등록한 함수 등록 취소
    controller!.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 탭 화면을 보여줄 위젯
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
    );
  }

  List<Widget> renderChildren() {
    return [
      Container(
        // 홈탭
        child: Center(
          child: Text(
            'Tab 1',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      Container(
        child: Center(
          child: Text(
            'Tab 2',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      )
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (int index) {
        // 탭이 선택될 때마다 실행되는 함수
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: [
        BottomNavigationBarItem(
          // 하단 탭바의 각 버튼을 구현
          icon: Icon(
            Icons.edgesensor_high_outlined,
          ),
          label: '주사위',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: '설정',
        ),
      ],
    );
  }
}
