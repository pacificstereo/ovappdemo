import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'schedule_drawer_model.dart';
export 'schedule_drawer_model.dart';

class ScheduleDrawerWidget extends StatefulWidget {
  const ScheduleDrawerWidget({super.key});

  @override
  State<ScheduleDrawerWidget> createState() => _ScheduleDrawerWidgetState();
}

class _ScheduleDrawerWidgetState extends State<ScheduleDrawerWidget> {
  late ScheduleDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleDrawerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0x00FFE3CA),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xBFFFFFFF),
              boxShadow: [
                BoxShadow(
                  blurRadius: 25.0,
                  color: FlutterFlowTheme.of(context).accent1,
                  offset: const Offset(0.0, 0.0),
                )
              ],
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: ClipRRect(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.9,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<SchedulesRecord>>(
                              stream: querySchedulesRecord(
                                queryBuilder: (schedulesRecord) =>
                                    schedulesRecord.where(
                                  'dates',
                                  arrayContains:
                                      dateTimeFormat('Md', getCurrentTimestamp),
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 35.0,
                                      height: 35.0,
                                      child: SpinKitChasingDots(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 35.0,
                                      ),
                                    ),
                                  );
                                }
                                List<SchedulesRecord> todaySchedulesRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final todaySchedulesRecord =
                                    todaySchedulesRecordList.isNotEmpty
                                        ? todaySchedulesRecordList.first
                                        : null;
                                return Container(
                                  width: 340.0,
                                  height: 340.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent4,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 25.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        offset: const Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRect(
                                            child: ImageFiltered(
                                              imageFilter: ImageFilter.blur(
                                                sigmaX: 10.0,
                                                sigmaY: 10.0,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 325.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    'Today\'s Schedule',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xBFE36D00),
                                                          fontSize: 35.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 325.0,
                                            decoration: const BoxDecoration(),
                                            child: Text(
                                              'Today\'s Schedule',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 35.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: OctoImage(
                                                  placeholderBuilder:
                                                      OctoPlaceholder.blurHash(
                                                    FFAppConstants.blurhash,
                                                  ),
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    todaySchedulesRecord.image,
                                                  ),
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag:
                                                    todaySchedulesRecord.image,
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: todaySchedulesRecord!.image,
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: OctoImage(
                                              placeholderBuilder:
                                                  OctoPlaceholder.blurHash(
                                                FFAppConstants.blurhash,
                                              ),
                                              image: CachedNetworkImageProvider(
                                                todaySchedulesRecord.image,
                                              ),
                                              width: 300.0,
                                              height: 250.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<SchedulesRecord>>(
                              stream: querySchedulesRecord(
                                queryBuilder: (schedulesRecord) =>
                                    schedulesRecord.where(
                                  'title',
                                  isEqualTo: 'Regular Day',
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 35.0,
                                      height: 35.0,
                                      child: SpinKitChasingDots(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 35.0,
                                      ),
                                    ),
                                  );
                                }
                                List<SchedulesRecord>
                                    todayRegularSchedulesRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final todayRegularSchedulesRecord =
                                    todayRegularSchedulesRecordList.isNotEmpty
                                        ? todayRegularSchedulesRecordList.first
                                        : null;
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Visibility(
                                    visible: !todayRegularSchedulesRecord!.dates
                                        .contains(dateTimeFormat(
                                            'Md', getCurrentTimestamp)),
                                    child: Container(
                                      width: 340.0,
                                      height: 340.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 25.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            offset: const Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRect(
                                                child: ImageFiltered(
                                                  imageFilter: ImageFilter.blur(
                                                    sigmaX: 10.0,
                                                    sigmaY: 10.0,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 325.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Text(
                                                        'Today\'s Schedule',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              color: const Color(
                                                                  0xBFE36D00),
                                                              fontSize: 35.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 325.0,
                                                decoration: const BoxDecoration(),
                                                child: Text(
                                                  'Today\'s Schedule',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 35.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.asset(
                                                      'assets/images/regular.jpg',
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: 'imageTag2',
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: 'imageTag2',
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image.asset(
                                                  'assets/images/regular.jpg',
                                                  width: 300.0,
                                                  height: 250.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Container(
                              width: 340.0,
                              height: 340.0,
                              decoration: BoxDecoration(
                                color: const Color(0xC0FFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    offset: const Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 325.0,
                                    decoration: const BoxDecoration(),
                                    child: Text(
                                      'Regular Day',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/regular.jpg',
                                      width: 300.0,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 5.0)),
                              ),
                            ),
                            Container(
                              width: 340.0,
                              height: 340.0,
                              decoration: BoxDecoration(
                                color: const Color(0xC0FFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    offset: const Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 325.0,
                                    decoration: const BoxDecoration(),
                                    child: Text(
                                      'FLEX',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/flex.jpg',
                                      width: 300.0,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 340.0,
                              height: 340.0,
                              decoration: BoxDecoration(
                                color: const Color(0xC0FFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    offset: const Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 325.0,
                                    decoration: const BoxDecoration(),
                                    child: Text(
                                      'Late Start',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/latestart.jpg',
                                      width: 300.0,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 5.0)),
                              ),
                            ),
                            Container(
                              width: 340.0,
                              height: 340.0,
                              decoration: BoxDecoration(
                                color: const Color(0xC0FFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    offset: const Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 325.0,
                                    decoration: const BoxDecoration(),
                                    child: Text(
                                      'Early Release',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/earlyrelease.jpg',
                                      width: 300.0,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 5.0)),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 25.0))
                              .addToEnd(const SizedBox(height: 25.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/downArrow.png',
                          width: 340.0,
                          height: 25.0,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
