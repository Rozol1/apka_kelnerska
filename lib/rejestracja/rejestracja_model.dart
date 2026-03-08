import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'rejestracja_widget.dart' show RejestracjaWidget;
import 'package:flutter/material.dart';

class RejestracjaModel extends FlutterFlowModel<RejestracjaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_Name widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  // State field(s) for TextField_Surename widget.
  FocusNode? textFieldSurenameFocusNode;
  TextEditingController? textFieldSurenameTextController;
  String? Function(BuildContext, String?)?
      textFieldSurenameTextControllerValidator;
  // State field(s) for TextField_Mail widget.
  FocusNode? textFieldMailFocusNode;
  TextEditingController? textFieldMailTextController;
  String? Function(BuildContext, String?)? textFieldMailTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? passwordTextController;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? confirmPasswordTextController;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldSurenameFocusNode?.dispose();
    textFieldSurenameTextController?.dispose();

    textFieldMailFocusNode?.dispose();
    textFieldMailTextController?.dispose();

    textFieldFocusNode1?.dispose();
    passwordTextController?.dispose();

    textFieldFocusNode2?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
