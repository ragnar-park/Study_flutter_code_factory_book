# u_and_i


## 사전 지식
### State() 함수
- State를 상속하는 모든 클래스는 setState() 함수를 사용할 수 있음
- setState() 함수가 실행되는 과정
  1. StatefulWidget의 렌더링이 끝나고 클린 상태. 플러터에서는 어떤 상태 변경 툴을 사용하든 클린 상태에서 상태를 변경해줘야 함
  2. setState()를 실행해서 원하는 속성들을 변경
  3. 속성이 변경되고 위젯의 상태가 더티로 설정
  4. build() GKATNRK WOTLFGODEHLA
  5. State가 클린 상태로 다시 되돌아옴
- setState() 함수를 실행하는 방법
  - 콜백 함수에 변경하고 싶은 속성들을 입력하여 매개변수로 전달
  - 해당 코드가 반영된 뒤 build() 함수가 실행
  - 콜백 함수가 비동기로 작성되면 안됌
### showCupertinoDialog() 함수
- 다이얼로그를 실행하는 함수
- 플러터에서 iOS 스타일의 얼럿을 만들수 있음
- Cupertino라고 정의된 만큼 iOS 스타일로 다일로그가 실행되며 실행 시 모든 애니메이션과 작동이 iOS 스타일로 적용
- 작성 순서
  1. Cupertino 위젯을 사용하기 위해 Cupertino 패키지를 불러옴
  2. showCupertinoDialog() 함수를 실행하면 Cupertino 스타일의 다이얼로그를 실행할 수 있음
  3. 모든 showDialog() 형태의 함수들은 BuildContext를 반드시 입력해야 함
  4. 플러터에서 다이얼로그 위젯 외의 흐림 처리기 된 부분을 베리어라고 부름, barrierDismissible에 true를 입력하면 베리어를 눌렀을때 닫히고 false를 입력하면 닫히지 않음
    4.1 위젯의 높이가 300인데 화면의 전체 높이가 1000이라면 나머지 700만큼의 부분이 베리어
  5. builder() 함수에 다이얼로그로 뛰우고 싶은 위젯을 반환해준다
