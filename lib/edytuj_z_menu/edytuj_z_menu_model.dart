import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edytuj_z_menu_widget.dart' show EdytujZMenuWidget;
import 'package:flutter/material.dart';

class EdytujZMenuModel extends FlutterFlowModel<EdytujZMenuWidget> {
  ///  Local state fields for this page.

  List<String> listaAlergenow = [];
  void addToListaAlergenow(String item) => listaAlergenow.add(item);
  void removeFromListaAlergenow(String item) => listaAlergenow.remove(item);
  void removeAtIndexFromListaAlergenow(int index) =>
      listaAlergenow.removeAt(index);
  void insertAtIndexInListaAlergenow(int index, String item) =>
      listaAlergenow.insert(index, item);
  void updateListaAlergenowAtIndex(int index, Function(String) updateFn) =>
      listaAlergenow[index] = updateFn(listaAlergenow[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - pobierzAlergenyZbazy] action in edytuj_z_menu widget.
  List<String>? pobraneAlergeny;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for nowaKategoriaField widget.
  FocusNode? nowaKategoriaFieldFocusNode;
  TextEditingController? nowaKategoriaFieldTextController;
  String? Function(BuildContext, String?)?
      nowaKategoriaFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for nowyAlergenField widget.
  FocusNode? nowyAlergenFieldFocusNode;
  TextEditingController? nowyAlergenFieldTextController;
  String? Function(BuildContext, String?)?
      nowyAlergenFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    nowaKategoriaFieldFocusNode?.dispose();
    nowaKategoriaFieldTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    nowyAlergenFieldFocusNode?.dispose();
    nowyAlergenFieldTextController?.dispose();
  }
}
