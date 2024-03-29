import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {

  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],

      // 시스템 UI 피해서 UI 그리기
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          // 위아레 끝에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // 반대쪽 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDAY(
              // 하느 눌렀을 떄 실행할 함수 전달
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {
  //  상태 변경 시 setState() 함수 실행
    setState(() {
      firstDay = firstDay.subtract(Duration(days: 1));
    });
  }

}



class _DDAY extends StatelessWidget {

  // 하트 눌렀을 때 실행할 함수
  final GestureTapCallback onHeartPressed;
  // 사귀기 시작한 날
  final DateTime firstDay;

  _DDAY({
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    // 테마 불러오기
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now(); // 현재 날짜 시간

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text( // 최상단 U&I 글자
          'U&I',
          style: textTheme.headline1,
        ),
        const SizedBox(height: 16.0),
        Text( // 두 번째 글자
          '우리 처음 만난 날',
          style: textTheme.bodyText1,
        ),
        Text( // 임시로 지정한 만난 날짜
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyText2,
        ),
        const SizedBox(height: 16.0),
        IconButton( // 하트 아이콘 버튼
            iconSize: 60.0,
            onPressed: onHeartPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            )
        ),
        const SizedBox(height: 16.0),
        Text(
          // DDAY 계산
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.headline2,
        )
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 오버플로 대응을 위한 Expanded추가
    // Expanded 위젯은 컨테이너의 크기에 맞게 위젯의 크기를 조절함, 컨테이너가 수평 방향이면 위젯의 너비를, 수직 방향이면 높이를 조절
    // 이미지가 남는 공간인만큼만 차지하도록 됨
    return Expanded(
        child: Center( // 이미지 중앙 정렬
          child: Image.asset(
          'asset/img/middle_image.png',

          // 화면의 반만큼 높이 구현
          // of 생성자
          // of(context)로 정의된 모든 생성자는 일반적으로 BuildContext를 매개변수로 받고 위젯 트리에서 가장 가까이 있는 객체의 값을 찾아냄
          // MediaQuery.of(context)는 현재 위젯 트리에서 가장 가까이 있는 MediaQuery값을 찾아냄
          // 1. 앱 실행시 MaterialApp이 빌드됨과 동시에 MediaQuery 생성
          // 2. 위젯 트리 아래에서 MediaQuery.of(context)를 실행하면 위젯 트리를 올라가며 가장 가까운 곳에 MediaQuery값을 가져옴
          // Expanded가 우선순위를 갖게 되어 무시 당함
          height: MediaQuery.of(context).size.height / 2,
          ),
        ),
    );
  }

}
