import '/flutter_flow/flutter_flow_util.dart';
import 'my_bookings2doc_widget.dart' show MyBookings2docWidget;
import 'package:flutter/material.dart';

class MyBookings2docModel extends FlutterFlowModel<MyBookings2docWidget> {
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
