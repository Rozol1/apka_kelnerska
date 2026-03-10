import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'menu_dodawania_widget.dart' show MenuDodawaniaWidget;
import 'package:flutter/material.dart';

class MenuDodawaniaModel extends FlutterFlowModel<MenuDodawaniaWidget> {
  ///  Local state fields for this component.

  String? wybranaKategoria;

  bool ukryjJajka = false;

  bool ukryjMleko = false;

  bool wymagajBezGlutenu = false;

  List<String> listaAlergenow = [];
  void addToListaAlergenow(String item) => listaAlergenow.add(item);
  void removeFromListaAlergenow(String item) => listaAlergenow.remove(item);
  void removeAtIndexFromListaAlergenow(int index) =>
      listaAlergenow.removeAt(index);
  void insertAtIndexInListaAlergenow(int index, String item) =>
      listaAlergenow.insert(index, item);
  void updateListaAlergenowAtIndex(int index, Function(String) updateFn) =>
      listaAlergenow[index] = updateFn(listaAlergenow[index]);

  List<String> listaKategorii = [];
  void addToListaKategorii(String item) => listaKategorii.add(item);
  void removeFromListaKategorii(String item) => listaKategorii.remove(item);
  void removeAtIndexFromListaKategorii(int index) =>
      listaKategorii.removeAt(index);
  void insertAtIndexInListaKategorii(int index, String item) =>
      listaKategorii.insert(index, item);
  void updateListaKategoriiAtIndex(int index, Function(String) updateFn) =>
      listaKategorii[index] = updateFn(listaKategorii[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - pobierzAlergenyZbazy] action in MenuDodawania widget.
  List<String>? wynikZAkcji;
  // Stores action output result for [Custom Action - pobierzKategorieZbazy] action in MenuDodawania widget.
  List<String>? wynikKategorii;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
