import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String? url;

  WebViewScreen({this.url});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url!));

    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
          controller: controller,

      ),
    );
  }
}
