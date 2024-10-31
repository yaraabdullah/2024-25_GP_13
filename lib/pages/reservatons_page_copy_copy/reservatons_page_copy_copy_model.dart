import '/flutter_flow/flutter_flow_util.dart';
import 'reservatons_page_copy_copy_widget.dart'
    show ReservatonsPageCopyCopyWidget;
import 'package:flutter/material.dart';

class ReservatonsPageCopyCopyModel
    extends FlutterFlowModel<ReservatonsPageCopyCopyWidget> {
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
