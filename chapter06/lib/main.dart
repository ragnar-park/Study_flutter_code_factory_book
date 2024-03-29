import 'package:basic_widgets/widgets/column_widget.dart';
import 'package:basic_widgets/widgets/container_widget.dart';
import 'package:basic_widgets/widgets/expanded_widget.dart';
import 'package:basic_widgets/widgets/flexible_widget.dart';
import 'package:basic_widgets/widgets/floating_action_button_widget.dart';
import 'package:basic_widgets/widgets/gesture_detector_widget.dart';
import 'package:basic_widgets/widgets/icon_button_widget.dart';
import 'package:basic_widgets/widgets/margin_widget.dart';
import 'package:basic_widgets/widgets/padding_widget.dart';
import 'package:basic_widgets/widgets/row_widget.dart';
import 'package:basic_widgets/widgets/safe_area_widget.dart';
import 'package:basic_widgets/widgets/sized_box_widget.dart';
import 'package:basic_widgets/widgets/stack_widget.dart';
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
          // child: IconButtonWidgetExample(),
          // child: GestureDetectorWidgetExample(),
          // child: FloatingActionButtonExample(),
          // child: ContainerWidgetExample(),
          // child: SizedBoxWidgetExample(),
          // child: PaddingWidgetExample(),
          // child: MarginWidgetExample(),
          // child: MarginWidgetExample(),
          // child: RowWidgetExample(),
          // child: ColumnWidgetExample(),
          // child: FlexibleWidgetExample(),
          // child: ExpandedWidgetExample(),
          child: StackWidgetExample(),
        ),
      ),
    );
  }

}