import '/flutter_flow/flutter_flow_util.dart';
import 'tweets_widget.dart' show TweetsWidget;
import 'package:flutter/material.dart';

class TweetsModel extends FlutterFlowModel<TweetsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
