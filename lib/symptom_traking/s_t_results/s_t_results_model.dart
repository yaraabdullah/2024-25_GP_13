import '/flutter_flow/flutter_flow_util.dart';
import 's_t_results_widget.dart' show STResultsWidget;
import 'package:flutter/material.dart';

class STResultsModel extends FlutterFlowModel<STResultsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
