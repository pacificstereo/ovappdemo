import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'article_drawer_model.dart';
export 'article_drawer_model.dart';

class ArticleDrawerWidget extends StatefulWidget {
  const ArticleDrawerWidget({
    super.key,
    required this.ref,
  });

  final DocumentReference? ref;

  @override
  State<ArticleDrawerWidget> createState() => _ArticleDrawerWidgetState();
}

class _ArticleDrawerWidgetState extends State<ArticleDrawerWidget> {
  late ArticleDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticleDrawerModel());
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
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: StreamBuilder<ArticlesRecord>(
                          stream: ArticlesRecord.getDocument(widget.ref!),
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
                            final columnArticlesRecord = snapshot.data!;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 325.0,
                                    decoration: const BoxDecoration(),
                                    child: Text(
                                      columnArticlesRecord.title,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 325.0,
                                    height: 225.0,
                                    decoration: const BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        if (columnArticlesRecord.mainImage !=
                                                '')
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              child: OctoImage(
                                                placeholderBuilder:
                                                    OctoPlaceholder.blurHash(
                                                  FFAppConstants.blurhash,
                                                ),
                                                image:
                                                    CachedNetworkImageProvider(
                                                  columnArticlesRecord
                                                      .mainImage,
                                                ),
                                                width: 325.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        if (columnArticlesRecord
                                            .albumImages.isNotEmpty)
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 325.0,
                                              height: 225.0,
                                              decoration: const BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final albumImages =
                                                      columnArticlesRecord
                                                          .albumImages
                                                          .toList();
                                                  return SizedBox(
                                                    width: 325.0,
                                                    height: 100.0,
                                                    child: Stack(
                                                      children: [
                                                        PageView.builder(
                                                          controller: _model
                                                                  .pageViewController ??=
                                                              PageController(
                                                                  initialPage: min(
                                                                      0,
                                                                      albumImages
                                                                              .length -
                                                                          1)),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: albumImages
                                                              .length,
                                                          itemBuilder: (context,
                                                              albumImagesIndex) {
                                                            final albumImagesItem =
                                                                albumImages[
                                                                    albumImagesIndex];
                                                            return Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image:
                                                                            OctoImage(
                                                                          placeholderBuilder:
                                                                              OctoPlaceholder.blurHash(
                                                                            FFAppConstants.blurhash,
                                                                          ),
                                                                          image:
                                                                              CachedNetworkImageProvider(
                                                                            albumImagesItem,
                                                                          ),
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            false,
                                                                        tag:
                                                                            albumImagesItem,
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      albumImagesItem,
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                    child:
                                                                        OctoImage(
                                                                      placeholderBuilder:
                                                                          OctoPlaceholder
                                                                              .blurHash(
                                                                        FFAppConstants
                                                                            .blurhash,
                                                                      ),
                                                                      image:
                                                                          CachedNetworkImageProvider(
                                                                        albumImagesItem,
                                                                      ),
                                                                      width:
                                                                          325.0,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: smooth_page_indicator
                                                              .SmoothPageIndicator(
                                                            controller: _model
                                                                    .pageViewController ??=
                                                                PageController(
                                                                    initialPage: min(
                                                                        0,
                                                                        albumImages.length -
                                                                            1)),
                                                            count: albumImages
                                                                .length,
                                                            axisDirection:
                                                                Axis.horizontal,
                                                            onDotClicked:
                                                                (i) async {
                                                              await _model
                                                                  .pageViewController!
                                                                  .animateToPage(
                                                                i,
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            effect: smooth_page_indicator
                                                                .ExpandingDotsEffect(
                                                              expansionFactor:
                                                                  2.0,
                                                              spacing: 8.0,
                                                              radius: 16.0,
                                                              dotWidth: 16.0,
                                                              dotHeight: 6.0,
                                                              dotColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                              activeDotColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              paintStyle:
                                                                  PaintingStyle
                                                                      .fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 275.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00FFE3CA),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final body = columnArticlesRecord
                                                .body
                                                .toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  body.length, (bodyIndex) {
                                                final bodyItem =
                                                    body[bodyIndex];
                                                return Text(
                                                  valueOrDefault<String>(
                                                    bodyItem,
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                );
                                              }).divide(const SizedBox(height: 10.0)),
                                            );
                                          },
                                        ),
                                        if (columnArticlesRecord.link != '')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await launchURL(
                                                  columnArticlesRecord.link);
                                            },
                                            child: Container(
                                              width: 125.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xBFE36D00),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    offset: const Offset(0.0, 2.0),
                                                    spreadRadius: 2.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Read More',
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
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.08,
                                          decoration: const BoxDecoration(
                                            color: Color(0x0039D2C0),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 10.0))
                                    .addToStart(const SizedBox(height: 25.0))
                                    .addToEnd(const SizedBox(height: 25.0)),
                              ),
                            );
                          },
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
