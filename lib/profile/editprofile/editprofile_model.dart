import '/flutter_flow/flutter_flow_util.dart';
import 'editprofile_widget.dart' show EditprofileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditprofileModel extends FlutterFlowModel<EditprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  final yourNameMask = MaskTextInputFormatter(mask: 'AAAAAAAAAAAAAAAAAAAAAAAA');
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Write email in the correct way.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for Age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  final ageMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for PN widget.
  FocusNode? pnFocusNode;
  TextEditingController? pnTextController;
  final pnMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? pnTextControllerValidator;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    pnFocusNode?.dispose();
    pnTextController?.dispose();
  }
}
