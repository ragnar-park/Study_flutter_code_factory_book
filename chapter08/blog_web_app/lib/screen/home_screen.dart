import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  // 웹뷰컨트롤러 선언
  WebViewController webViewController = WebViewController()

  // webViewController의 loadRequest() 함수를 실행
  ..loadRequest(Uri.parse('https://blog.codefactory.ai'))

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

      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
  
}