import '/components/header_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

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
