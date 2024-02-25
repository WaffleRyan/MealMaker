import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_auth2_widget.dart' show EditProfileAuth2Widget;
import 'package:flutter/material.dart';

class EditProfileAuth2Model extends FlutterFlowModel<EditProfileAuth2Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for yourHeight widget.
  FocusNode? yourHeightFocusNode;
  TextEditingController? yourHeightController;
  String? Function(BuildContext, String?)? yourHeightControllerValidator;
  // State field(s) for yourWeight widget.
  FocusNode? yourWeightFocusNode;
  TextEditingController? yourWeightController;
  String? Function(BuildContext, String?)? yourWeightControllerValidator;
  // State field(s) for yourAge widget.
  FocusNode? yourAgeFocusNode;
  TextEditingController? yourAgeController;
  String? Function(BuildContext, String?)? yourAgeControllerValidator;
  // State field(s) for yourGoal widget.
  String? yourGoalValue;
  FormFieldController<String>? yourGoalValueController;
  // State field(s) for yourActivity widget.
  String? yourActivityValue;
  FormFieldController<String>? yourActivityValueController;
  // State field(s) for yourSex widget.
  String? yourSexValue;
  FormFieldController<String>? yourSexValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    yourHeightFocusNode?.dispose();
    yourHeightController?.dispose();

    yourWeightFocusNode?.dispose();
    yourWeightController?.dispose();

    yourAgeFocusNode?.dispose();
    yourAgeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
