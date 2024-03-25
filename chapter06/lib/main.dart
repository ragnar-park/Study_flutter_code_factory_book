import 'package:basic_widgets/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IconButtonWidgetExample(),
        ),
      ),
    );
  }

}