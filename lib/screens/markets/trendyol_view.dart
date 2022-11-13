import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrendyolView extends StatefulWidget {
  const TrendyolView({Key? key}) : super(key: key);

  @override
  State<TrendyolView> createState() => _TrendyolViewState();
}

class _TrendyolViewState extends State<TrendyolView> {
  final GlobalKey webViewKey = GlobalKey();

  WebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trendyol"),
      ),
      body: _webview(),
    );
  }

  WebView _webview() {
    return WebView(
        key: webViewKey,
        initialUrl: "https://myip.com",
        userAgent:
            "Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-G973U) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/14.2 Chrome/87.0.4280.141 Mobile Safari/537.36",
        onWebViewCreated: (controller) {
          webViewController = controller;
        });
  }
}
