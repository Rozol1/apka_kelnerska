import '/components/order_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'strona_historia_zam_page_widget.dart' show StronaHistoriaZamPageWidget;
import 'package:flutter/material.dart';

class StronaHistoriaZamPageModel
    extends FlutterFlowModel<StronaHistoriaZamPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OrderItem.
  late OrderItemModel orderItemModel;

  @override
  void initState(BuildContext context) {
    orderItemModel = createModel(context, () => OrderItemModel());
  }

  @override
  void dispose() {
    orderItemModel.dispose();
  }
}
