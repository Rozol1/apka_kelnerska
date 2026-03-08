import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'karta_pozycji_model.dart';
export 'karta_pozycji_model.dart';

class KartaPozycjiWidget extends StatefulWidget {
  const KartaPozycjiWidget({
    super.key,
    required this.daneZamowienia,
  });

  final OrderedItemsRecord? daneZamowienia;

  @override
  State<KartaPozycjiWidget> createState() => _KartaPozycjiWidgetState();
}

class _KartaPozycjiWidgetState extends State<KartaPozycjiWidget> {
  late KartaPozycjiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KartaPozycjiModel());

    _model.textController ??=
        TextEditingController(text: widget.daneZamowienia?.comment);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: StreamBuilder<ProductsRecord>(
          stream:
              ProductsRecord.getDocument(widget.daneZamowienia!.productRef!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }

            final containerProductsRecord = snapshot.data!;

            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                containerProductsRecord.name,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                containerProductsRecord.description,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      formatNumber(
                                        containerProductsRecord.calories,
                                        formatType: FormatType.custom,
                                        format: '0 kcal',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        functions.wypiszAlergeny(
                                            containerProductsRecord
                                                .isGlutenFree,
                                            containerProductsRecord
                                                .containsEggs,
                                            containerProductsRecord
                                                .containsMilk),
                                        'Brak alergenów',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 30.0,
                                  fillColor: FlutterFlowTheme.of(context).error,
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 15.0,
                                  ),
                                  onPressed: () async {
                                    await widget.daneZamowienia!.reference
                                        .delete();
                                  },
                                ),
                              ],
                            ),
                            Text(
                              formatNumber(
                                functions.obliczKwote(
                                    containerProductsRecord.price.toDouble(),
                                    widget.daneZamowienia?.quantity),
                                formatType: FormatType.custom,
                                format: '0.00 zł',
                                locale: '',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 14.0,
                                  buttonSize: 28.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  icon: Icon(
                                    Icons.remove,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 14.0,
                                  ),
                                  onPressed: () async {
                                    await widget.daneZamowienia!.reference
                                        .update({
                                      ...createOrderedItemsRecordData(
                                        itemTotalPrice: functions.obliczKwote(
                                            containerProductsRecord.price
                                                .toDouble(),
                                            functions.zmniejszIlosc(widget
                                                .daneZamowienia!.quantity)),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'quantity':
                                              FieldValue.increment(-(1)),
                                        },
                                      ),
                                    });
                                  },
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.daneZamowienia?.quantity
                                        .toString(),
                                    '1',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 14.0,
                                  buttonSize: 28.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 14.0,
                                  ),
                                  onPressed: () async {
                                    await widget.daneZamowienia!.reference
                                        .update({
                                      ...createOrderedItemsRecordData(
                                        itemTotalPrice: functions.obliczKwote(
                                            containerProductsRecord.price
                                                .toDouble(),
                                            functions.zwiekszIlosc(widget
                                                .daneZamowienia!.quantity)),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'quantity': FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                  },
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                        () async {
                          await widget.daneZamowienia!.reference
                              .update(createOrderedItemsRecordData(
                            comment: _model.textController.text,
                          ));
                        },
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Komentarz do pozycji...',
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                      maxLines: 2,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
