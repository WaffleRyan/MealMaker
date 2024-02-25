import '/flutter_flow/flutter_flow_util.dart';
import 'edit_page_widget.dart' show EditPageWidget;
import 'package:flutter/material.dart';

class EditPageModel extends FlutterFlowModel<EditPageWidget> {
  ///  Local state fields for this page.

  bool showResponse = false;

  String sample = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ingredientName widget.
  FocusNode? ingredientNameFocusNode;
  TextEditingController? ingredientNameController;
  String? Function(BuildContext, String?)? ingredientNameControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    ingredientNameFocusNode?.dispose();
    ingredientNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
