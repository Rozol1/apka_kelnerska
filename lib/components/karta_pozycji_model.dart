import '/flutter_flow/flutter_flow_util.dart';
import 'karta_pozycji_widget.dart' show KartaPozycjiWidget;
import 'package:flutter/material.dart';

class KartaPozycjiModel extends FlutterFlowModel<KartaPozycjiWidget> {
  ///  Local state fields for this component.

  DocumentReference? stolikRef;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
