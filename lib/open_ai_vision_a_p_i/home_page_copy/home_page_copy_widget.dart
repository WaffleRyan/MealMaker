import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/open_ai_vision_a_p_i/loading_widget/loading_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_page_copy_model.dart';
export 'home_page_copy_model.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({super.key});

  @override
  State<HomePageCopyWidget> createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget>
    with TickerProviderStateMixin {
  late HomePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 140.0),
          end: const Offset(0.0, 0.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(-0.175, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(115.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.showResponse = false;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 1170.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Upload an Image of Your Receipt',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'Try to crop the image to only show the names of the items bought',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Container(
                                      width: 300.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setDarkModeSetting(
                                                      context, ThemeMode.light);
                                                },
                                                child: Container(
                                                  width: 115.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                      ),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.wb_sunny_rounded,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Light Mode',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .light
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setDarkModeSetting(
                                                      context, ThemeMode.dark);
                                                },
                                                child: Container(
                                                  width: 115.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.nightlight_round,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Dark Mode',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'containerOnActionTriggerAnimation']!,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: StreamBuilder<
                                                  List<RequestsRecord>>(
                                                stream: queryRequestsRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<RequestsRecord>
                                                      containerRequestsRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 360.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(4.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final selectedMedia =
                                                              await selectMediaWithSourceBottomSheet(
                                                            context: context,
                                                            allowPhoto: true,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            setState(() => _model
                                                                    .isDataUploading =
                                                                true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              setState(() {
                                                                _model.uploadedLocalFile =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                            } else {
                                                              setState(() {});
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              _model
                                                                  .uploadedFileUrl,
                                                              'https://t4.ftcdn.net/jpg/05/65/22/41/360_F_565224180_QNRiRQkf9Fw0dKRoZGwUknmmfk51SuSS.jpg',
                                                            ),
                                                            width: 500.0,
                                                            height: 360.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 500.0,
                                              height: 360.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      _model.uploadedFileUrl,
                                                      'https://t4.ftcdn.net/jpg/05/65/22/41/360_F_565224180_QNRiRQkf9Fw0dKRoZGwUknmmfk51SuSS.jpg',
                                                    ),
                                                    width: 500.0,
                                                    height: 360.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ].addToEnd(const SizedBox(height: 16.0)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('itemsCopy');
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        height: 44.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        hoverBorderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        hoverTextColor:
                                            FlutterFlowTheme.of(context).info,
                                        hoverElevation: 3.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, -1.0),
                                      child: Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            // showloading
                                            showDialog(
                                              barrierColor: const Color(0x001D2428),
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: const SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child:
                                                          LoadingWidgetWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            var requestsRecordReference =
                                                RequestsRecord.collection.doc();
                                            await requestsRecordReference
                                                .set(createRequestsRecordData(
                                              status: 'pending',
                                              task: 'receipt',
                                              link: _model.uploadedFileUrl,
                                              item: currentUserUid,
                                            ));
                                            _model.aiResponse = RequestsRecord
                                                .getDocumentFromData(
                                                    createRequestsRecordData(
                                                      status: 'pending',
                                                      task: 'receipt',
                                                      link: _model
                                                          .uploadedFileUrl,
                                                      item: currentUserUid,
                                                    ),
                                                    requestsRecordReference);

                                            context.pushNamed('items');

                                            setState(() {});
                                          },
                                          text: 'Continue',
                                          options: FFButtonOptions(
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall,
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            hoverBorderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            hoverElevation: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 16.0)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 630.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ].addToEnd(const SizedBox(height: 44.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ),
        ),
      ),
    );
  }
}
