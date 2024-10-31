import '/components/ai_chat_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chatbot_widget.dart' show ChatbotWidget;
import 'package:flutter/material.dart';

class ChatbotModel extends FlutterFlowModel<ChatbotWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for aiChat_Component component.
  late AiChatComponentModel aiChatComponentModel;

  @override
  void initState(BuildContext context) {
    aiChatComponentModel = createModel(context, () => AiChatComponentModel());
  }

  @override
  void dispose() {
    aiChatComponentModel.dispose();
  }
}
