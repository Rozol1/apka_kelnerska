import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'strona_startowa_widget.dart' show StronaStartowaWidget;
import 'package:flutter/material.dart';

class StronaStartowaModel extends FlutterFlowModel<StronaStartowaWidget> {
  ///  Local state fields for this page.

  DateTime? obecnyCzas;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in strona_startowa widget.
  RestaurantsRecord? pobranaRestauracja;
  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
