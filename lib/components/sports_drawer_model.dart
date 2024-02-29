import '/flutter_flow/flutter_flow_util.dart';
import 'sports_drawer_widget.dart' show SportsDrawerWidget;
import 'package:flutter/material.dart';

class SportsDrawerModel extends FlutterFlowModel<SportsDrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
