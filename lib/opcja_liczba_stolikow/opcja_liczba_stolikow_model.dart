import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'opcja_liczba_stolikow_widget.dart' show OpcjaLiczbaStolikowWidget;
import 'package:flutter/material.dart';

class OpcjaLiczbaStolikowModel
    extends FlutterFlowModel<OpcjaLiczbaStolikowWidget> {
  ///  Local state fields for this page.

  int licznikStolikow = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in opcja_liczba_stolikow widget.
  List<TablesRecord>? pobraneStoliki;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
