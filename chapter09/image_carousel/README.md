# image_carousel

## 위젯 생명주기
- 위젯이 화면에 그려지는 순간부터 삭제되는 순간까지의 주기를 의미
### StatelessWidget 생명주기
- 상태가 없는 위젯
- 생명주기
  1. StatelessWidget이 빌드되면 생성자가 실행
  2. 필수로 오버라이드 해야하는 build() 함수가 실행
  3. 마지막으로 build() 함수에 반환된 위젯이 화면에 렌더링
- 플러터에서 모든 위젯은 Widget 클래스를 상속함
- Widget 클래스는 불변(immutable)특성을 가짐
- 불변이란 클래스를 한 번 생성하고 나면 속성을 변경할 수 없다는 뜻
- 하지만 위젯의 속성을 변경해야 할 때가 존재
  - 새로운 매개변수가 입력되는 경우
  - build() 함수에서 매개변수 갑을 사용하고 있다면 위젯은 불변이기 때문에, 기존 인스턴스의 build() 함수는 재실행되지 않음
  - 대신 인스턴스를 새로 생성한 후 기존 인스턴스를 대체해서 변경 사항을 화면에 반영
### StatefulWidget 생명주기
- 외부에서위젯 생성자의 매개변수를 변경해주면 위젯이 새롭게 생성되고 build()가 실행되기 까지 과정은 StatelessWidget과 동일
- 위젯 내부에서 자체적으로 build() 함수를 재실행해야 할 때 사용
- StatelessWidget과 다르게 StatefulWidget은 클래스와 스테이트 클래스 2개로 구성되어 있음
- 상태 변경이 없는 생명주기
  - 위젯이 화면에 나타나며 생성되고 화면에서 사라지며 삭제되는 과정을 의미
  - 중간에 위젯의 상태가 변경되지 않음
  - 생명주기
    1. StatefulWidget 생성자 실행
    2. createState() 함수 실행
       2.1 해당 함수는 필수로 오버라이드해야 하는 함수로, StatefulWidget과 연동되는 State를 생성
    3. State가 생성되면 initState()가 실행
       3.1 initState()는 State가 생성되는 순간에만 단 한번 실행 (절대 다시 실행x)
    4. didChangeDependencies()가 실행
       4.1 initState()와 다르게 BuildContext가 제공
       4.2 State가 의존하는 값이 변경되면 재실행
    5. State의 상태가 dirty로 설정
       5.1 dirty 상태는 build()가 재실행돼야 하는 상태
    6. 5.1 에 따라서 build() 함수 실행되고 UI 반영
    7. build() 실행이 완료되면 상태가 clean 상태로 변경
       7.1 화면에 변화가 없으면 이 상태를 유지
    8. 위젯이 위젯 트리에서 사라지면 deactivate()가 실행
       8.1 deactivate()는 State가 일시적 또는 영구적으로 삭제될 때 실행
    9. dispose()가 실행
        9.1 위젯이 영구적으로 삭제될 때 실행
- StatefulWidget 생성자의 매개변수가 변경됐을 때 생명주기
  - 클래스이기 때문에 매개벼수를 입력받을 수 있음
  - 위젯이 생성된 후 삭제가 되기 전 매개변수가 변경되면 다음 생명주기가 실행
    1. StatefulWidget 생성자 실행
    2. State의 didUpdateWidget() 함수가 실행
    3. State가 dirty 상태로 변경
    4. build()가 실행
    5. State의 상태가 clean으로 변경
- State 자제적으로 build()를 재실행할 때 생명주기
  - StatefulWidget은 StatefulWidget 클래스와 State 클래스로 구성
  - State 클래스는 setState() 함수를 실행해서 build() 함수를 자체적으로 재실행 할 수 있음
  - 생명주기
    1. setState()를 실행
    2. State가 dirty 상태로 변경
    3. build()가 실행
    4. State의 상태가 clean으로 변경

## Timer
- Timer는 특정 시간이 지난 후에 일회성 또는 지속적으로 함수를 실행함
- 실행 주기와 주기가 지날 떄마다 실행할 콜백 함수를 매개변수로 받음

## 페이지뷰
- PageView는 여러 개의 위젯을 단독 페이지로 생성하고 가로 또는 세로 스와이프로 페이지를 넘길 수 있게 하는 위젯
- BoxFit.cover를 설정하여 이미지가 최대한 전체 화면을 차지하도록 늘림
  - 자세한 속성은 도서 참고

## 상태바 색상 변경
- 상태바란 앱을 실행 중에 핸드폰 배터리, 시간, 와이파이 연결 상태 등을 보여주는 영역

## 타이머 추가
- Timer 클래스를 사용해서 액자가 자동으로 롤링되는 기능 추가
- Timer 클래스를 추가하려면 HomeScreen을 StatelessWidget이 아닌 StatefulWidget으로 변경 해야 함
- StatelessWidget을 그대로 사용하면 Timer를 등록할 수 있는 위차가 build()함수밖에 없음
  - 이렇게 하게 되면 위젯이 새로 생성될 떄마다, build() 함수가 불릴 때마다 매번 새로운 Timer가 생성됨 -> 메모리 누수
- StatefulWidget의 initState()를 사용하면 State가 생성될 떄 딱 한번만 Timer를 생성할 수 있음

    
