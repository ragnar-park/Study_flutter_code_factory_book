# basic_widgets
- Everythings is a Widget!
- 플러터에서 화면에 보여지는 UI와 관련된 모든 요소는 위젯으로 구성
- 위젯은 주어진 상태(state)를 기반으로 어떤 UI를 구현할지 정의
- 위젯의 상태가 변경되면 변경 사항에 알맞게 변경된 UI를 화면에 다시 그려줌
- 기존 상태의 위젯과 새로운 상태의 위젯을 비교해서 UI 변화를 반영할 때 필요한 최소한의 변경 사항을 산출해서 화면을 그려냄
- 최소한의 리소스를 이용해서 UI qusrud
- 쉽게 120FPS까지 높은 퍼포먼스 발휘
- 위젯은 자식을 하나만 갖는 위젯과 자식을 여럿 갖는 위젯으로 냐뉨
## 자식을 하나만 갖는 대표적인 위젯
### 대체로 child 매개변수를 입력 받음
- Container 위젯
  - 자식을 담는 컨테이너 역할
  - 단순하게 자식을 담는 역할이 아닌 배경색, 너비와 높이, 태두리 등의 디자인을 지정할 수 있음
- GestureDetector 위젯
  - 플러터에서 제공하는 제스처 기능을 자식 위젯에서 인식 하는 위젯
  - 탭이나 드래그 그리고 더블 클릭 같은 제스처 기능이 자식 위젯에 인식됐을 떄 함수 실행 가능
- SizedBox 위젯
  - 높이와 너비를 지정하는 위젯
  - Container 위젯과 다르게 디자인적 요소 적용 불가능
  - const 생성자로 선언할 수 있어 퍼포먼스 측면에서 더 효율

## 다수의 자식을 입력할 수 있는 위젯
### children 매개변수를 입력받으며 리스트로 여러 위젯을 입력 할 수 있음
- Column 위젯
  - children 매개변수에 입력된 모든 위젯들을 세로로 배치
- Row 위젯
  - children 매개변수에 입력된 모든 위젯들을 가로로 배치
- ListView 위젯
  - 리스트를 구현할 때 사용
  - children 매개변수에 다수의 위젯 입력할 수 있으며, 입력한 위젯이 화며을 벗어나게 되면 스크롤이 가능해짐


## Children와 child의 차이점
- child 매개변수와 children 매개변수는 위젯에 하위 위젯을 추가할 때 사용
- child 는 위젯을 하나만 추가할 수 있고 children은 여럿을 추가할 수 있음
- 대부분 위젯은 child 또는 children 매개변수르 하나만 제공
- child와 children를 동시에 입력받는 위젯은 존재하지 않음

## 텍스트 위젯
- Text 위젯은 글자를 적고 스타일링 하는 위젯
- 첫 번째 포지셔널 파라미터에 원하는 문자열 작성
- style 이라는 네임드 파라미터를 사용해 스타일 지정
- 플러터는 RichText 위젯과 Paragraph 같은 클래스도 제공

## 제스처 관련 위젯
- 사용자가 키보드로 글자를 입력하는 행위 외의 모든 입력을 플러터에서는 제스처라고 부름
- 화면을 탭하거나, 두 번 탭하거나, 길게 누르는 행동 모두가 제스처
- GestureDetector 위젯은 모든 제스처를 매개변수로 제공
- 제스처 관련 위젯은 하위 위젯에 탭이나 드래그처럼 특정 제스처가 입력됐을 떄 인지하고 콜백 함수를 실행

### Button 위젯
- 플러터 머터리얼 패키지에서 기본 제공
- TextButton, OutlineButton, ElevatedButton이 존재
  - 세 버튼 모두 누르면 색이 변경되는 리플 효과 지원
### IconButton 위젯
- 아이콘을 버튼으로 생성하는 위젯
- Icons 클래스를 통해 플러터 기본 제공 아이콘 사용 가ㄸ
### GestureDetector 위젯
- 앱은 모든 입력을 손가락으로 함
- 손가락으로 하는 여러 가지 입력을 인지하는 위젯
### FloatingActionButton 위젯
- Material Design에서 추구하는 버튼 형태
- 안드로이드 앱들을 사용하다 보면 화면의 오른쪽 아래 동그란 플로팅 작업 버튼을 쉽게 볼 수 있음

## 디자인 관련 위젯
- 배경, 간격, 패딩등을 추가하는 디자인적 요소를 적용할 때 사용
### Container 위젯
- 다른 위젯을 담는 데 사용
- 위젯의 너비와 높이를 지정하거나, 배경이나 테두리를 추가할 때 많이 사용
- 다른 위젯처럼 child 매개변수 사용 가능
### SizeBox 위젯
- 일정 크기의 공간을 공백으로 두고 싶을 때 사용
- Container 위젯으로 공백을 만들 수 있지만 SizeBox는 const 생성자를 사용했을 때 퍼포먼스에서 이점을 얻을 수 있음
### Padding 위젯
- child 위젯에 여백을 제공할 때 사용
- Padding 위젯의 상위 위젯과 하위 위젯 사이의 여백을 둘 수 있음
- Padding 위젯의 padding 매개변수는 EdgeInsets라는 값을 입력해야 함
- child 매개변수에 Padding을 적용하고 싶은 위젯을 입력할 수 있음
- 마진도 존재함
  - 플러터에서 자주 사용하지 않음
  - 위젯의 바깥에 간격 추가
  - 따로 위젯이 존재하지 않고 Container 위젯에 추가할 수 있음
### SafeArea 
- 현대 핸드폰의 다양한 디자인속에서 기기별로 예외 처리 하지 않고도 안전한 화면에서만 위젯을 그릴 수 있게 하는 위젯

## 배치 관련 위젯
- 배치 관련 위젯은 하위 위젯을 가로 또는 세로로 배치하거나 위젯 위에 겹칠 때 사용
### Row 위젯
- Row는 Column과 함께 위젯을 가로세로로 배치하는데 사용
- Row는 위젯을 가로로 배치
- 하나의 child 위젯을 입력받는 위젯들과 다르게 여러 개의 child 위젯을 입력받을 수 있는 children 매개변수를 노출
- Row는 Column에는 주측과 반대축 개념이 존재
  - Row는 가로가 주축, 세로가 반대축
  - Column의 경우 가로가 반대축, 세로가 주축
- Row 위젯의 crossAxisAligmment 매개 변수를 테스트하려면 위젯들을 배치할 공간을 확보해야 함
- MainAxisAlignment 옵션
  - MainAxisAlignment.start -> 시작에 정렬
  - MainAxisAlignment.center -> 중앙에 정렬
  - MainAxisAlignment.end -> 끝에 정렬
  - MainAxisAlignment.spaceBetween -> 자식 위젯의 간격을 균등하게 정렬
  - MainAxisAlignment.spaceAround -> 자식 위젯의 간격을 균등하게 배정하고 왼쪽 끝과 오른쪽 끝을 위젯 사이 거리의 반만큼만 배정해 정렬
  - MainAxisAlignment.spaceEvenly -> 자식 위젯의 간격을 균등하게 배치하고 왼쪽 끝과 오른쪽 끝도 균등하게 배치
- CrossAxisAlignment 옵션
  - CrossAxisAlignment.start -> 시작에 정렬
  - CrossAxisAlignment.center -> 중앙에 정렬
  - CrossAxisAlignment.end -> 끝에 정렬
  - CrossAxisAlignment.stretch -> 반대축 최대한으로 늘려서 정렬
### Column 위젯
- Row 위젯과 완전히 같은 매개변수들을 노출
- 단, 주축과 반대축이 Row와 반대로 이루어져 있음
### Flexible 위젯
- Row나 Column에서 사용하는 위젯
- Flexbile에 제공된 child가 크기를 최소한으로 차지하게 할 수 있음
- flex 매개변수를 이용해 각 Flexble 위젯이 얼만큼의 비율로 공간을 차지할지 지정할 수 있음
### Expanded 위젯
- Flexaible 위젯을 상속하는 위젯
- Column과 Row에서 Expended를 사용하면 위젯이 남아 있는 공간을 최대한으로 차지
- Flexible 위젯은 fit 매개변수에 FlexFit.tight 또는 FlexFit.loose를 입력할 수 있음,
  - FlexFit.loose는 자식 위젯이 필요한 만큼의 공간만 차지함
  - FlexFit.tight는 자식 위젯이 차지하는 공간과 관계없이 남은 공간을 모두 차지
  - Expanded 위젯은 Flexible 위젯의 fit 매개 변수에 FlexFit.tight를 기본으로 제공해준 위젯
- Flexble과 마찬가지로 flex 매개변수의 값에 따라 변경됨
### Stack 위젯
- Row와 Column 위젯은 각각 가로와 세로 위젯을 배치
- 반면 Stack 위젯은 위젯은 겹치는 기능을 제공
- 플러터의 그래픽 엔진인 스카이 엔진은 2D 엔진이기 때문에 겹친 두깨를 표현하지는 못함
- 위젯 위에 위젯을 올린 듯한 효과를 줄 수 있음
- children에 위치한 순서대로 위젯을 겹치게 함