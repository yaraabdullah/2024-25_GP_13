import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dashboard01_recent_activity_model.dart';
export 'dashboard01_recent_activity_model.dart';

class Dashboard01RecentActivityWidget extends StatefulWidget {
  const Dashboard01RecentActivityWidget({super.key});

  @override
  State<Dashboard01RecentActivityWidget> createState() =>
      _Dashboard01RecentActivityWidgetState();
}

class _Dashboard01RecentActivityWidgetState
    extends State<Dashboard01RecentActivityWidget>
    with TickerProviderStateMixin {
  late Dashboard01RecentActivityModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Dashboard01RecentActivityModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.698, 0),
            end: const Offset(0, 0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 24.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Filter by:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: const Color(0xFF484A51),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Container(
                    height: 32.0,
                    constraints: const BoxConstraints(
                      maxHeight: 32.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.radio_button_checked_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 25.0,
                          ),
                          Text(
                            'Depression',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 32.0,
                    constraints: const BoxConstraints(
                      maxHeight: 32.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.radio_button_checked_sharp,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 25.0,
                          ),
                          Text(
                            'Anxiety',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.radio_button_checked_sharp,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 25.0,
                  ),
                  Text(
                    'sleep                       ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        height: 250.0,
                        child: FlutterFlowLineChart(
                          data: [
                            FFLineChartData(
                              xData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomDate()),
                              yData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) =>
                                      random_data.randomInteger(0, 1000)),
                              settings: LineChartBarData(
                                color: FlutterFlowTheme.of(context).primary,
                                barWidth: 2.0,
                              ),
                            ),
                            FFLineChartData(
                              xData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomInteger(0, 10)),
                              yData: List.generate(
                                  random_data.randomInteger(5, 5),
                                  (index) => random_data.randomInteger(0, 10)),
                              settings: LineChartBarData(
                                color: FlutterFlowTheme.of(context).secondary,
                                barWidth: 2.0,
                              ),
                            )
                          ],
                          chartStylingInfo: ChartStylingInfo(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            showBorder: false,
                          ),
                          axisBounds: const AxisBounds(
                            minX: 0.0,
                            minY: 0.0,
                            maxX: 3.0,
                            maxY: 100.0,
                          ),
                          xAxisLabelInfo: AxisLabelInfo(
                            title: 'date',
                            titleTextStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                            showLabels: true,
                            labelTextStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                    ),
                            labelInterval: 10.0,
                            labelFormatter: LabelFormatter(
                              numberFormat: (val) => formatNumber(
                                val,
                                formatType: FormatType.percent,
                              ),
                            ),
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            title: 'test score',
                            titleTextStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                            showLabels: true,
                            labelTextStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            labelInterval: 10.0,
                            labelFormatter: LabelFormatter(
                              numberFormat: (val) => val.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: '      View more      ',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
