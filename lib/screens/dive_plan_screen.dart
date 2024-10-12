import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlFromAssetsPage extends StatefulWidget {
  @override
  _HtmlFromAssetsPageState createState() => _HtmlFromAssetsPageState();
}

class _HtmlFromAssetsPageState extends State<HtmlFromAssetsPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // WebViewController para carregar a página
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int Progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate; // Permitir a navegação
          },
        ),
      )
      ..loadFlutterAsset(
          'lib/assets/html/plano_mergulho.html'); // Carregar o arquivo HTML
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plano de Mergulho'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
