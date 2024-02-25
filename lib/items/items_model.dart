import '/flutter_flow/flutter_flow_util.dart';
import 'items_widget.dart' show ItemsWidget;
import 'package:flutter/material.dart';

class ItemsModel extends FlutterFlowModel<ItemsWidget> {
  ///  Local state fields for this page.

  bool? isEditing;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
