import '/flutter_flow/flutter_flow_util.dart';
import 'list06_user_search_widget.dart' show List06UserSearchWidget;
import 'package:flutter/material.dart';

class List06UserSearchModel extends FlutterFlowModel<List06UserSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
