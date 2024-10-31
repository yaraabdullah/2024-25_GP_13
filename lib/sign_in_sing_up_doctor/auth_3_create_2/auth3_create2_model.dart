import '/flutter_flow/flutter_flow_util.dart';
import 'auth3_create2_widget.dart' show Auth3Create2Widget;
import 'package:flutter/material.dart';

class Auth3Create2Model extends FlutterFlowModel<Auth3Create2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Interest widget.
  FocusNode? interestFocusNode;
  TextEditingController? interestTextController;
  String? Function(BuildContext, String?)? interestTextControllerValidator;
  // State field(s) for Speciality widget.
  FocusNode? specialityFocusNode;
  TextEditingController? specialityTextController;
  String? Function(BuildContext, String?)? specialityTextControllerValidator;
  // State field(s) for About widget.
  FocusNode? aboutFocusNode;
  TextEditingController? aboutTextController;
  String? Function(BuildContext, String?)? aboutTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressTextController1;
  String? Function(BuildContext, String?)? emailAddressTextController1Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressTextController2;
  String? Function(BuildContext, String?)? emailAddressTextController2Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    interestFocusNode?.dispose();
    interestTextController?.dispose();

    specialityFocusNode?.dispose();
    specialityTextController?.dispose();

    aboutFocusNode?.dispose();
    aboutTextController?.dispose();

    emailAddressFocusNode1?.dispose();
    emailAddressTextController1?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressTextController2?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();
  }
}
