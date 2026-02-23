import '/flutter_flow/flutter_flow_util.dart';
import 'edytuj_menu_widget.dart' show EdytujMenuWidget;
import 'package:flutter/material.dart';

class EdytujMenuModel extends FlutterFlowModel<EdytujMenuWidget> {
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
