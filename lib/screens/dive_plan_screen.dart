/*
<DiveCalc is an app to help Public Safety Divers>
Copyright (C) <2024>  <Nicollas Soares Goncalves>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlFromAssetsPage extends StatefulWidget {
  const HtmlFromAssetsPage({super.key});

  @override
  HtmlFromAssetsPageState createState() => HtmlFromAssetsPageState();
}

class HtmlFromAssetsPageState extends State<HtmlFromAssetsPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // WebViewController para carregar a página
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // ignore: non_constant_identifier_names
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
