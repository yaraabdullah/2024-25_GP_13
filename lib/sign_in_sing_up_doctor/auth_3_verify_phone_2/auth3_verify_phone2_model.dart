import '/flutter_flow/flutter_flow_util.dart';
import 'auth3_verify_phone2_widget.dart' show Auth3VerifyPhone2Widget;
import 'package:flutter/material.dart';

class Auth3VerifyPhone2Model extends FlutterFlowModel<Auth3VerifyPhone2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
