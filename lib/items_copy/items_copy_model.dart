import '/flutter_flow/flutter_flow_util.dart';
import 'items_copy_widget.dart' show ItemsCopyWidget;
import 'package:flutter/material.dart';

class ItemsCopyModel extends FlutterFlowModel<ItemsCopyWidget> {
  ///  Local state fields for this page.

  bool? isEditing;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ingredientsTextField widget.
  FocusNode? ingredientsTextFieldFocusNode;
  TextEditingController? ingredientsTextFieldController;
  String? Function(BuildContext, String?)?
      ingredientsTextFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    ingredientsTextFieldFocusNode?.dispose();
    ingredientsTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
