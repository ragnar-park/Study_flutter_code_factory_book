import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// URI/URL을 생성하는데 도움을 주는 클래스
final uri = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  // 웹뷰컨트롤러 선언
  WebViewController webViewController = WebViewController()

  // webViewController의 loadRequest() 함수를 실행
  ..loadRequest(uri)

  // JavaScript가 제한 없이 실행될 수 있도록 함
  ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바 위젯 추가
      appBar: AppBar(

        // 배경색 지정
        backgroundColor: Colors.orange,

        // 앱 타이틀 성정
        title: Text('Ragnar'),

        // 가운데 정렬
        centerTitle: true,

        // AppBar에 액션 버튼을 추가할 수 있는 매개변수
        actions: [
          IconButton(
              // 아이콘을 눌렀을 때 실행할 콜백 함수
              onPressed: () {
                webViewController.loadRequest(uri);
              },
              icon: Icon(
                Icons.home
              ),
          )
        ],

      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
  
}