import '/components/header_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connect_widget.dart' show ConnectWidget;
import 'package:flutter/material.dart';

class ConnectModel extends FlutterFlowModel<ConnectWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headerTitle component.
  late HeaderTitleModel headerTitleModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerTitleModel = createModel(context, () => HeaderTitleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerTitleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
