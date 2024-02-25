import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'loading_widget_model.dart';
export 'loading_widget_model.dart';

class LoadingWidgetWidget extends StatefulWidget {
  const LoadingWidgetWidget({super.key});

  @override
  State<LoadingWidgetWidget> createState() => _LoadingWidgetWidgetState();
}

class _LoadingWidgetWidgetState extends State<LoadingWidgetWidget>
    with TickerProviderStateMixin {
  late LoadingWidgetModel _model;

  final animationsMap = {
    'lottieAnimationOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 900.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1.0, 1.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 1400.ms,
          duration: 900.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(0.8, 0.8),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 5.0,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: Lottie.asset(
                      'assets/lottie_animations/Building_Loading.json',
                      width: 260.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ).animateOnPageLoad(
                        animationsMap['lottieAnimationOnPageLoadAnimation']!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                  child: Text(
                    'Analyzing your design file...',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                ),
                Text(
                  'This will take up to 30 seconds.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
