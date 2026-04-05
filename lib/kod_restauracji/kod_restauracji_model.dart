import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kod_restauracji_widget.dart' show KodRestauracjiWidget;
import 'package:flutter/material.dart';

class KodRestauracjiModel extends FlutterFlowModel<KodRestauracjiWidget> {
  ///  Local state fields for this page.

  int licznikStolikow = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in kod_restauracji widget.
  List<TablesRecord>? pobraneStoliki;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
