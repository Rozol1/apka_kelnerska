import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'stolik_widget.dart' show StolikWidget;
import 'package:flutter/material.dart';

class StolikModel extends FlutterFlowModel<StolikWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrderedItemsRecord>? pobraneDania;
  // Stores action output result for [Custom Action - skompilujSzczegolyRachunku] action in Button widget.
  List<String>? gotoweSzczegoly;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
