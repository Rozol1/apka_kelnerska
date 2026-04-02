import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'rejestracja_widget.dart' show RejestracjaWidget;
import 'package:collection/collection.dart';
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
  FocusNode? textFieldMailFocusNode1;
  TextEditingController? textFieldMailTextController1;
  String? Function(BuildContext, String?)?
      textFieldMailTextController1Validator;
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
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField_Mail widget.
  FocusNode? textFieldMailFocusNode2;
  TextEditingController? textFieldMailTextController2;
  String? Function(BuildContext, String?)?
      textFieldMailTextController2Validator;
  // State field(s) for TextField_Mail widget.
  FocusNode? textFieldMailFocusNode3;
  TextEditingController? textFieldMailTextController3;
  String? Function(BuildContext, String?)?
      textFieldMailTextController3Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RestaurantsRecord? stworzonaRestauracja;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<RestaurantsRecord>? szukanaRestauracja;

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

    textFieldMailFocusNode1?.dispose();
    textFieldMailTextController1?.dispose();

    textFieldFocusNode1?.dispose();
    passwordTextController?.dispose();

    textFieldFocusNode2?.dispose();
    confirmPasswordTextController?.dispose();

    textFieldMailFocusNode2?.dispose();
    textFieldMailTextController2?.dispose();

    textFieldMailFocusNode3?.dispose();
    textFieldMailTextController3?.dispose();
  }
}
