import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:proxy_test/core/proxy_helper.dart';
import 'package:proxy_test/screens/markets/trendyol_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show HttpOverrides, Platform;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = ProxyHelper();

  if (kIsWeb == false && Platform.isAndroid) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: IconButton(
          iconSize: 66,
          color: Colors.black87,
          icon: const Icon(Icons.ads_click),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TrendyolView()));
          },
        )));
  }
}