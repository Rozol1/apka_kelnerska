import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'zmiana_hasla_widget.dart' show ZmianaHaslaWidget;
import 'package:flutter/material.dart';

class ZmianaHaslaModel extends FlutterFlowModel<ZmianaHaslaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for AktualneHasloText widget.
  FocusNode? aktualneHasloTextFocusNode;
  TextEditingController? aktualneHasloTextTextController;
  late bool aktualneHasloTextVisibility;
  String? Function(BuildContext, String?)?
      aktualneHasloTextTextControllerValidator;
  // State field(s) for noweHasloText widget.
  FocusNode? noweHasloTextFocusNode;
  TextEditingController? noweHasloTextTextController;
  late bool noweHasloTextVisibility;
  String? Function(BuildContext, String?)? noweHasloTextTextControllerValidator;
  // State field(s) for potwierdzNoweHasloText widget.
  FocusNode? potwierdzNoweHasloTextFocusNode;
  TextEditingController? potwierdzNoweHasloTextTextController;
  late bool potwierdzNoweHasloTextVisibility;
  String? Function(BuildContext, String?)?
      potwierdzNoweHasloTextTextControllerValidator;
  // Stores action output result for [Custom Action - zmienHasloBezpiecznie] action in Button widget.
  String? wynikZmiany;

  @override
  void initState(BuildContext context) {
    aktualneHasloTextVisibility = false;
    noweHasloTextVisibility = false;
    potwierdzNoweHasloTextVisibility = false;
  }

  @override
  void dispose() {
    aktualneHasloTextFocusNode?.dispose();
    aktualneHasloTextTextController?.dispose();

    noweHasloTextFocusNode?.dispose();
    noweHasloTextTextController?.dispose();

    potwierdzNoweHasloTextFocusNode?.dispose();
    potwierdzNoweHasloTextTextController?.dispose();
  }
}
