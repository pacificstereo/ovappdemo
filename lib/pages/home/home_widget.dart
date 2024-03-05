import '/backend/backend.dart';
import '/components/article_drawer_widget.dart';
import '/components/business_drawer_widget.dart';
import '/components/club_drawer_widget.dart';
import '/components/header_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Stack(
              alignment: const AlignmentDirectional(0.0, -1.0),
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 500.0,
                          height: MediaQuery.sizeOf(context).height * 0.055,
                          decoration: const BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                        ),
                        StreamBuilder<List<HomePageRecord>>(
                          stream: queryHomePageRecord(
                            queryBuilder: (homePageRecord) =>
                                homePageRecord.where(
                              'id',
                              isEqualTo: 'Article List',
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 35.0,
                                  ),
                                ),
                              );
                            }
                            List<HomePageRecord> carouselHomePageRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final carouselHomePageRecord =
                                carouselHomePageRecordList.isNotEmpty
                                    ? carouselHomePageRecordList.first
                                    : null;
                            return SizedBox(
                              width: 350.0,
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/upArrow.png',
                                            width: 340.0,
                                            height: 25.0,
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 25.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              offset: const Offset(0.0, 0.0),
                                            )
                                          ],
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final articleList =
                                                carouselHomePageRecord
                                                        ?.articleList
                                                        .toList() ??
                                                    [];
                                            return SizedBox(
                                              width: 350.0,
                                              height: 225.0,
                                              child: CarouselSlider.builder(
                                                itemCount: articleList.length,
                                                itemBuilder: (context,
                                                    articleListIndex, _) {
                                                  final articleListItem =
                                                      articleList[
                                                          articleListIndex];
                                                  return StreamBuilder<
                                                      ArticlesRecord>(
                                                    stream: ArticlesRecord
                                                        .getDocument(
                                                            articleListItem),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            child:
                                                                SpinKitChasingDots(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final imageArticlesRecord =
                                                          snapshot.data!;
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: const Color(
                                                                0x00FFFFFF),
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      ArticleDrawerWidget(
                                                                    ref:
                                                                        articleListItem,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          child: OctoImage(
                                                            placeholderBuilder:
                                                                OctoPlaceholder
                                                                    .blurHash(
                                                              'LIRLnQX9gOn\$*^Ipf,js_NxCWAbI',
                                                            ),
                                                            image: NetworkImage(
                                                              imageArticlesRecord
                                                                  .coverImage,
                                                            ),
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                carouselController: _model
                                                        .carouselController ??=
                                                    CarouselController(),
                                                options: CarouselOptions(
                                                  initialPage: min(0,
                                                      articleList.length - 1),
                                                  viewportFraction: 1.0,
                                                  disableCenter: true,
                                                  enlargeCenterPage: true,
                                                  enlargeFactor: 0.25,
                                                  enableInfiniteScroll: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  autoPlay: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 800),
                                                  autoPlayInterval: const Duration(
                                                      milliseconds:
                                                          (800 + 4000)),
                                                  autoPlayCurve: Curves.linear,
                                                  pauseAutoPlayInFiniteScroll:
                                                      true,
                                                  onPageChanged: (index, _) =>
                                                      _model.carouselCurrentIndex =
                                                          index,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                ],
                              ),
                            );
                          },
                        ),
                        StreamBuilder<List<HomePageRecord>>(
                          stream: queryHomePageRecord(
                            queryBuilder: (homePageRecord) =>
                                homePageRecord.where(
                              'id',
                              isEqualTo: 'Announcement',
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 35.0,
                                  ),
                                ),
                              );
                            }
                            List<HomePageRecord> homeSectionHomePageRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final homeSectionHomePageRecord =
                                homeSectionHomePageRecordList.isNotEmpty
                                    ? homeSectionHomePageRecordList.first
                                    : null;
                            return Container(
                              width: 340.0,
                              decoration: BoxDecoration(
                                color: const Color(0xC0FFAB5E),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    offset: const Offset(0.0, 0.0),
                                    spreadRadius: 10.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRect(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 2.0,
                                            sigmaY: 2.0,
                                          ),
                                          child: Container(
                                            width: 300.0,
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  homeSectionHomePageRecord
                                                      ?.title,
                                                  'Title',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xC0E36D00),
                                                          fontSize: 30.0,
                                                          letterSpacing: 1.0,
                                                        ),
                                                minFontSize: 25.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 300.0,
                                        decoration: const BoxDecoration(),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            homeSectionHomePageRecord?.title,
                                            'Title',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 30.0,
                                                letterSpacing: 1.0,
                                              ),
                                          minFontSize: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: OctoImage(
                                      placeholderBuilder:
                                          OctoPlaceholder.blurHash(
                                        'LIRLnQX9gOn\$*^Ipf,js_NxCWAbI',
                                      ),
                                      image: CachedNetworkImageProvider(
                                        homeSectionHomePageRecord!.image,
                                      ),
                                      width: 300.0,
                                      height: 225.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 300.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final body = homeSectionHomePageRecord
                                                .body
                                                .toList() ??
                                            [];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(body.length,
                                              (bodyIndex) {
                                            final bodyItem = body[bodyIndex];
                                            return Text(
                                              valueOrDefault<String>(
                                                bodyItem,
                                                'Hello World',
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            );
                                          }).divide(const SizedBox(height: 5.0)),
                                        );
                                      },
                                    ),
                                  ),
                                  if (homeSectionHomePageRecord.ref != null)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: const Color(0x00FFFFFF),
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: ArticleDrawerWidget(
                                                  ref:
                                                      homeSectionHomePageRecord.ref!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: 125.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xBFE36D00),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              offset: const Offset(0.0, 2.0),
                                              spreadRadius: 2.0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Read More',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ]
                                    .divide(const SizedBox(height: 10.0))
                                    .addToStart(const SizedBox(height: 10.0))
                                    .addToEnd(const SizedBox(height: 15.0)),
                              ),
                            );
                          },
                        ),
                        Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 360.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x7FE36D00),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 25.0,
                                      color: Color(0xBEE36D00),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            ClipRect(
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 5.0,
                                  sigmaY: 5.0,
                                ),
                                child: Container(
                                  height: 75.0,
                                  decoration: const BoxDecoration(),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    height: 60.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        'Coyote Spotlight',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0x7FE36D00),
                                              fontSize: 45.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                height: 60.0,
                                decoration: const BoxDecoration(),
                                child: AutoSizeText(
                                  'Coyote Spotlight',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 45.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        StreamBuilder<List<HomePageRecord>>(
                          stream: queryHomePageRecord(
                            queryBuilder: (homePageRecord) =>
                                homePageRecord.where(
                              'id',
                              isEqualTo: 'Club Spotlight',
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 35.0,
                                  ),
                                ),
                              );
                            }
                            List<HomePageRecord>
                                clubSpotlightHomePageRecordList =
                                snapshot.data!;
                            final clubSpotlightHomePageRecord =
                                clubSpotlightHomePageRecordList.isNotEmpty
                                    ? clubSpotlightHomePageRecordList.first
                                    : null;
                            return Container(
                              width: 360.0,
                              decoration: const BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: SizedBox(
                                width: 340.0,
                                height: 475.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 150.0, 0.0, 0.0),
                                        child: Container(
                                          width: 300.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xBFFFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                offset: const Offset(0.0, 0.0),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 200.0,
                                              height: 225.0,
                                              decoration: const BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final bodyClub =
                                                      clubSpotlightHomePageRecord
                                                              ?.body
                                                              .toList() ??
                                                          [];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        bodyClub.length,
                                                        (bodyClubIndex) {
                                                      final bodyClubItem =
                                                          bodyClub[
                                                              bodyClubIndex];
                                                      return Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: AutoSizeText(
                                                          bodyClubItem,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        const SizedBox(height: 5.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Container(
                                          width: 190.0,
                                          height: 190.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xBFFFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                offset: const Offset(0.0, 0.0),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 165.0,
                                              height: 165.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl:
                                                    clubSpotlightHomePageRecord!
                                                        .image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, -1.0),
                                      child: Container(
                                        width: 200.0,
                                        height: 200.0,
                                        decoration: const BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              clubSpotlightHomePageRecord
                                                  .title,
                                              'Club Spotlight',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 35.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                            minFontSize: 30.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: const Color(0x00FFFFFF),
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: ClubDrawerWidget(
                                                      ref:
                                                          clubSpotlightHomePageRecord.clubRef!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xBFE36D00),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  offset: const Offset(0.0, 0.0),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Read More',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 25.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        StreamBuilder<List<HomePageRecord>>(
                          stream: queryHomePageRecord(
                            queryBuilder: (homePageRecord) =>
                                homePageRecord.where(
                              'id',
                              isEqualTo: 'Business Spotlight',
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 35.0,
                                  ),
                                ),
                              );
                            }
                            List<HomePageRecord>
                                businessSpotlightHomePageRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final businessSpotlightHomePageRecord =
                                businessSpotlightHomePageRecordList.isNotEmpty
                                    ? businessSpotlightHomePageRecordList.first
                                    : null;
                            return Container(
                              width: 360.0,
                              decoration: const BoxDecoration(
                                color: Color(0x00FFFFFF),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: SizedBox(
                                width: 340.0,
                                height: 475.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 150.0, 0.0, 0.0),
                                        child: Container(
                                          width: 300.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xC0FFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                offset: const Offset(0.0, 0.0),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 200.0,
                                              height: 225.0,
                                              decoration: const BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final bodyBusiness =
                                                      businessSpotlightHomePageRecord
                                                              ?.body
                                                              .toList() ??
                                                          [];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        bodyBusiness.length,
                                                        (bodyBusinessIndex) {
                                                      final bodyBusinessItem =
                                                          bodyBusiness[
                                                              bodyBusinessIndex];
                                                      return AutoSizeText(
                                                        bodyBusinessItem,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      );
                                                    }).divide(
                                                        const SizedBox(height: 5.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Container(
                                          width: 190.0,
                                          height: 190.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xBFFFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                offset: const Offset(0.0, 0.0),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 165.0,
                                              height: 165.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl:
                                                    businessSpotlightHomePageRecord!
                                                        .image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: Container(
                                        width: 200.0,
                                        height: 200.0,
                                        decoration: const BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              businessSpotlightHomePageRecord
                                                  .title,
                                              'Business Spotlight',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 35.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                            minFontSize: 30.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 25.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: const Color(0x00FFFFFF),
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: BusinessDrawerWidget(
                                                      ref:
                                                          businessSpotlightHomePageRecord.businessRef!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xBFE36D00),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  offset: const Offset(0.0, 0.0),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Read More',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 25.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          width: 500.0,
                          height: MediaQuery.sizeOf(context).height * 0.12,
                          decoration: const BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                        ),
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x00FFE3CA),
                          FlutterFlowTheme.of(context).alternate
                        ],
                        stops: const [0.0, 1.0],
                        begin: const AlignmentDirectional(0.0, -1.0),
                        end: const AlignmentDirectional(0, 1.0),
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.headerTitleModel,
                  updateCallback: () => setState(() {}),
                  child: const HeaderTitleWidget(
                    title: 'Home',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
