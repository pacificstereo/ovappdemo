import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'header_title_model.dart';
export 'header_title_model.dart';

class HeaderTitleWidget extends StatefulWidget {
  const HeaderTitleWidget({
    super.key,
    String? title,
  }) : title = title ?? 'Title';

  final String title;

  @override
  State<HeaderTitleWidget> createState() => _HeaderTitleWidgetState();
}

class _HeaderTitleWidgetState extends State<HeaderTitleWidget> {
  late HeaderTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderTitleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.12,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [FlutterFlowTheme.of(context).alternate, const Color(0x00FFE3CA)],
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(0.0, -1.0),
          end: const AlignmentDirectional(0, 1.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.075,
                decoration: const BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                  child: AutoSizeText(
                    widget.title,
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily: 'Inter',
                          fontSize: 90.0,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
